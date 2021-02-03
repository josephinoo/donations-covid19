import 'package:flutter/material.dart';
import '../pages/DonarForm.dart';
import 'DonarForm.dart';
import '../services/centros.dart';

class SelectionCentre extends StatelessWidget {
  List<Locations> centre = [
    Locations(
        name: 'Hospital Alcivar',
        description:
            'centro hospitalario ubicacion  Idelfonso Coronel y Mendez 2301, Guayaquil 090101',
        accoutn: '101304050'),
    Locations(
        name: 'Hospital infectologia',
        description:
            'centro hospitalario ubicacion   Julián Coronel, Guayaquil 090514',
        accoutn: '101424050'),
    Locations(
        name: 'centro de salud SOLCA',
        description:
            'centro hospitalario ubicacion  av 9 de octubre , Guayaquil 090101',
        accoutn: '101774050'),
    Locations(
        name: 'HOSPITAL REPÚBLICA DEL ECUADOR',
        description:
            'centro hospitalario ubicacion  gomez y coronel 2411, azual 090101',
        accoutn: '108877050'),
    Locations(
        name: 'HOSPITAL DR. GUSTAVO DOMINGUEZ Z.	',
        description:
            'centro hospitalario ubicacion ZONA 4	SANTO DOMINGO DE LOS TSÁCHILAS, azual 090101',
        accoutn: '108661050'),
    Locations(
        name: 'CENTRO DE ATENCIÓN INTEGRAL AL ADULTO MAYOR - PATATE',
        description:
            'centro hospitalario ubicacion  gomez y coronel 2301, azual 090101',
        accoutn: '108844150'),
    Locations(
        name: 'CENTRO DE ATENCIÓN INTEGRAL AL ADULTO MAYOR - PATATE',
        description: 'centro hospitalario , azual 090101',
        accoutn: '108833250'),
  ];
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
      body: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemCount: centre.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(centre[index].name),
              subtitle: Text(centre[index].description),
              leading: Icon(Icons.account_balance, color: Colors.lightBlue),
              trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonarForm(centre[index].name),
                      ),
                    );
                  }));
        });
  }

  Widget _cardCentre(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(20),
          child: InkWell(
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
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DonarForm("data")));
            },
          )),
    );
  }
}
