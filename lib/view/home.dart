import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("SUDO Glossary", style: TextStyle(color: Colors.white))),
      body: Container(
        padding: EdgeInsets.only(top: 90, bottom: 180, left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(width: double.infinity),
            Text("Title",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            Text(
                "A database system developed by Microsoft. Part of Microsoft Office Professional. Mostly used on low traffic web sites running on the Windows platform.",
                style: TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,),
            const Spacer(),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, fixedSize: Size(256, 64)),
              child: Text("RANDOM",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, fixedSize: Size(128, 32)),
              child: Text("REVEAL", style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
