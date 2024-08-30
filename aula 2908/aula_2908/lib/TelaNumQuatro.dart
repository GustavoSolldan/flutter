import "package:flutter/material.dart";


class TelaNumQuatro extends StatefulWidget{
  @override
  _TelaNumQuatroState createState() => _TelaNumQuatroState();

}

class _TelaNumQuatroState extends State<TelaNumQuatro>{
  @override

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Número 4"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: const Column(
          children: <Widget>[
            Text(
              "Quarta Tela",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}