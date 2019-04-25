import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using APIs',
      home: Scaffold(
        appBar: AppBar(
          title: Text('API Wikipedia'),
        ),
        body: MyMainPage()
      ),
    );
  }
}

class MyMainPage extends StatefulWidget {
  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {

  Map dato; //Donde se almacena el .JSON
  String titulo,consulta="";
  String textohtml="";

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://es.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles="+consulta),
        headers: {
          "Accept": "application/json"
        }
    );
    dato = jsonDecode(response.body);
    print(dato["query"]);
    Map pages= dato["query"]["pages"];
    var primerallave=pages.keys.first;
    titulo=pages[primerallave]["title"];
    setState(() {
      textohtml=pages[primerallave]["extract"];
    });
    return "Success!";
  }



  //RETORNO WIDGET------------------------
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15,left: 10,right: 20),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "            Ingresa tu consulta"
                  ),
                  onChanged: (value){
                    setState(() {
                      consulta=value.replaceAll(" ","_").toLowerCase();
                    });
                  },



                ),
              ),
              SizedBox(width: 20,)
              ,
              RaisedButton(onPressed: (){
                getData();
              },
                child: Container(
                  child: Text("Consultar",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                splashColor: Colors.blue,
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                textColor: Colors.blue,

              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: Html(data: textohtml),
        ),
      ],
    );
  }
}
