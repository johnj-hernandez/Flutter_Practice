import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('IMC Calculator'),
        ),
        body: Center(
          child: Imc(),
        ),
      ),
    );
  }
}

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  int masa=0;
  double altura=0.0;
  double imc=0;
  String mensaje="";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "IBM CALCULATOR",
            style: TextStyle(fontSize: 30),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                    child:TextField(
                      decoration: InputDecoration(
                        labelText: "Peso (KG)",
                      ),
                      onChanged: (value){
                        masa=int.parse(value);
                      },
                      keyboardType: TextInputType.number,
                    )
                ),
                SizedBox(width: 22.0,),
                Flexible(
                    child:TextField(
                      decoration: InputDecoration(
                        labelText: "Altura (metros)",
                      ),
                      onChanged: (value){
                        altura=double.parse(value);
                      },
                      keyboardType: TextInputType.number,
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  //resultado=operando1+operando2;
                  imc=masa/(altura*altura);
                  imc= double.parse(imc.toStringAsFixed(2));
                  if(imc<18.5){
                    mensaje="BAJO PESO";
                  }else if(imc<25){
                    mensaje="NORMAL";
                  }else{
                    mensaje="SOBREPESO";
                  }

                });

              },
              child: Container(
                child: Text(
                    "Calcular IMC"
                ),
              ),
            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Su indice de masa corporal es: "+(imc==0?"": imc.toString()),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              mensaje,
              style: TextStyle(
                  color: mensaje=="NORMAL"?Colors.green:Colors.red,
                  fontSize: 20,

              ),


            ),

          )
        ],

      ),
    );
  }
}

