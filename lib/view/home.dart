import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: Text("Pseudo Glossary",
              style: GoogleFonts.luxuriousRoman(color: Colors.white))),
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
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: viewModel.getRandomTerm,
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, fixedSize: Size(256, 64)),
              child: Text("RANDOM",
                  style: GoogleFonts.literata(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: revealDescription,
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, fixedSize: Size(128, 32)),
              child: Text("REVEAL",
                  style: GoogleFonts.literata(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
