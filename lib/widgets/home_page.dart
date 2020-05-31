import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:jsonduvida/model/models.dart';
import 'dart:async';

import 'package:jsonduvida/widgets/detalhe.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//METODO QUE CONECTA A API
  Future<List<Albums>> fetchItunesAlbuns() async {
    var url = "https://code-mobile.net/apis/vereadores.json";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      final albums = albumsFromJson(utf8.decode(response.bodyBytes));
      //print(albums);
      return albums;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

//WIDGET QUE LISTA OS DADOS DA API
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f9fd),
      body: Container(
        child: FutureBuilder(
          future: fetchItunesAlbuns(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  //COMEÇA AQUI
                  return GestureDetector(
                    child: GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffe6f2fc),
                          ),
                          width: double.infinity,
                          //height: 130,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 80,
                                margin: EdgeInsets.only(right: 15),
                                child: Image.network(
                                  snapshot.data[index].foto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                      //width: 60,
                                      //height: 80,
                                      margin: EdgeInsets.only(right: 15),
                                      child: Text(
                                        snapshot.data[index].nomeUrna
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(height: 10),
                                  Container(
                                      //width: 60,
                                      //height: 80,
                                      margin: EdgeInsets.only(right: 15),
                                      child: Text(
                                        snapshot.data[index].partido.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      //width: 60,
                                      //height: 80,
                                      margin: EdgeInsets.only(right: 15),
                                      child: Text(
                                        snapshot.data[index].cargo.toString(),
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detalhe(snapshot.data[index])));
                        }),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
