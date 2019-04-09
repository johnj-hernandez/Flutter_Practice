import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  @override
  _SumaState createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  int operando1=0;
  int operando2=0;
  int resultado=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "SUMA",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30,right: 30,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Operando 1',
                    ),
                    onChanged: (value){
                      operando1=int.parse(value.toString());
                    },
                  ),
                ),
                SizedBox(width: 20.0,),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Operando 2',
                    ),
                    onChanged: (value){
                      operando2=int.parse(value.toString());
                    },
                  ),
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
                    resultado=operando1+operando2;
                  });

            },
              child: Container(
                child: Text(
                  "Calcular"
                ),
              ),
            ),

         ),
          Container(
            margin: EdgeInsets.only(right: 60,top: 50),
            child: Text(
                "El resultado de la operacion es:",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              resultado==null? "":resultado.toString(),
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 50
              ),
            ),
          )
        ],
      ),
    );
  }
}
