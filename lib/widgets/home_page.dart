import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:jsonduvida/model/models.dart';
import 'dart:async';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//METODO QUE CONECTA A API
 Future<Albums> fetchItunesAlbuns() async {
    var url = "https://code-mobile.net/apis/vereadores.json";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      final albums = albumsFromJson(response.body);
      print(albums);
      //return albums;
    }else{
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffe6f2fc),
                      ),
                      width: double.infinity,
                      //height: 130,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        ],
                      ),
                    ),
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
