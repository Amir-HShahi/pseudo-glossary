import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudo_random/view_model/term_model_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TermViewModel>();
    final term = viewModel.mainTerm;

    void revealDescription() {
      setState(() {
        term.isDescriptionHidden = false;
      });
    }

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
            Text(term.title,
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: term.isDescriptionHidden ? 0 : 1,
              child: Text(
                term.description,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: viewModel.getRandomTerm,
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, fixedSize: Size(256, 64)),
              child: Text("RANDOM",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: revealDescription,
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
