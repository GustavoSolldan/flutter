import "package:flutter/material.dart";


class TelaNumCinco extends StatefulWidget{
  @override
  _TelaNumCincoState createState() => _TelaNumCincoState();

}

class _TelaNumCincoState extends State<TelaNumCinco>{
  @override

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Número 5"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: const Column(
          children: <Widget>[
            Text(
              "Quinta Tela",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}