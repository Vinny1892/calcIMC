import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String _infoText = "Informe seus dados";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                 weightController.text= "";
                 heightController.text="";
              },
            )
          ],
          backgroundColor: Colors.green,
        ),
        body: Form(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                      Icon(Icons.person_outline,size: 100.00, color: Colors.green, ),
                      TextFormField( keyboardType: TextInputType.number, 
                      decoration: InputDecoration( 
                        labelText: "Peso" , 
                        labelStyle: TextStyle(color: Colors.green),
                        fillColor: Colors.green
                        ),
                      style:  TextStyle(color: Colors.green), 
                      controller: weightController, 
                      ),
                      TextFormField( 
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.green),
                        decoration: InputDecoration(
                          labelText: "Altura",
                          labelStyle: TextStyle(color: Colors.green),


                        ),
                        controller: heightController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child:RaisedButton(
                          child: Text("Calcular" ,style: TextStyle(color: Colors.green),),
                          color: Colors.white,
                          elevation: 7.0,
                          onPressed: (){
                            var height =  double.parse(this.heightController.text);
                            debugPrint("height"+this.heightController.text);
                             debugPrint("weight" +this.weightController.text);
                            var weight = double.parse(this.weightController.text);
                            double imc = weight / (height * height);
                            _infoText = imc.toString();
                            
                          },
                          splashColor: Colors.green,
                        )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: Text(_infoText, 
                          style: TextStyle(color: Colors.green , fontSize: 15),
                          textAlign: TextAlign.center,
                          ),
                        ) 
                      

                    ],
                ),
            )
          )
        );
  }
}
