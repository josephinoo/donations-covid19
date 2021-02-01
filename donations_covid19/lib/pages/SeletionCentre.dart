import 'package:flutter/material.dart';

class SelectionCentre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.all(10);
    return Scaffold(
        appBar: AppBar(
          title: Text("Centros de Salud"),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Color(0xFF17ead9), Color(0xFF00d4ff)]))),
        ),
        body: SingleChildScrollView(
          padding: edgeInsets,
          child: Center(
              child: Column(
            children: <Widget>[
              _cardCentre(),
              _cardCentre(),
              _cardCentre(),
              _cardCentre(),
              _cardCentre(),
              _cardCentre(),
              _cardCentre(),
              _cardCentre()
            ],
          )),
        ));
  }

  Widget _cardCentre() {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              "Centro de Salud",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Ubicación en Quito-Ecuador"),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sollicitudin magna ullamcorper ligula eleifend faucibus. Duis sed leo diam. Aliquam.")
          ],
        ),
      ),
    );
  }
}
