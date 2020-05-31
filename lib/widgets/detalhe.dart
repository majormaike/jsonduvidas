import 'package:flutter/material.dart';
import 'package:jsonduvida/model/models.dart';

class Detalhe extends StatelessWidget {
  final Albums user;
  Detalhe(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f9fd),
      body: Column(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff68869c),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          user.nomeUrna,
                          style: TextStyle(color: Colors.white, fontSize: 19),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list, color: Color(0xff68869c)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 10),
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 150,
                            margin: EdgeInsets.only(right: 15),
                            child: Image.network(user.foto),
                          ),
                        ]),

                    // Text('Numero de casos no Ceará: ' + user.confirmedGeral.toString()),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        elevation: 1,
                        child: Column(children: <Widget>[
                          Container(
                            //height: 80,
                            alignment: Alignment.center,
                            child: Text(
                              user.registro.toString(),
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Número do Registro',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
