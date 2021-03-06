import 'package:flutter/material.dart';

import 'package:america_precolombina/src/providers/menu_provider.dart';

class IncasEstructuraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Estructura los Incas'),
            backgroundColor: Color(0xffba6323)),
        body: _cardList());
  }

  Widget _cardList() {
    return FutureBuilder(
      future: provider.loadData('data/incas_info.json', 'estructura'),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _cardItem(snapshot.data),
        );
      },
    );
  }

  List<Widget> _cardItem(List<dynamic> data) {
    final List<Widget> info = [];
    data.forEach((element) {
      var vest = "";
      if (element['vestimenta'] != '') {
        vest = element['vestimenta'];
      }
      final widgetTemp = Card(
        elevation: 20.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ListTile(
              title: Text(element['titulo']),
              contentPadding: EdgeInsets.all(20.0),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(element['texto']),
            ),
            FadeInImage(
                image: NetworkImage(element['imagen']),
                placeholder: AssetImage('assets/giphy.gif'),
                fadeInDuration: Duration(milliseconds: 100),
                height: 300.0,
                width: 360.0,
                fit: BoxFit.cover),
            Container(
                padding: EdgeInsets.all(5.0), child: Text(element['titulo'])),
            Container(padding: EdgeInsets.all(20), child: Text(vest)),
          ],
        ),
      );
      info
        ..add(widgetTemp)
        ..add(SizedBox(
          height: 20.0,
        ));
    });
    return info;
  }
}
