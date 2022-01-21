import 'package:bingo/app_colors.dart';
import 'package:bingo/quotes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Quotes qu = Quotes();

class BingoPage extends StatefulWidget {
  const BingoPage({Key? key}) : super(key: key);

  @override
  _BingoPageState createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> {
  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed2 = false;
  bool _hasBeenPressed3 = false;
  bool _hasBeenPressed4 = false;
  bool _hasBeenPressed5 = false;
  bool _hasBeenPressed6 = false;
  bool _hasBeenPressed7 = false;
  bool _hasBeenPressed8 = false;
  bool _hasBeenPressed9 = false;

  var randomPicker = List<int>.generate(qu.quotesList.length - 1, (i) => i + 1)
    ..shuffle();

  List<String> randomQuotes = [];

  void przypisanie(List<String> randomQuotes, List<int> randomPicker) {
    for (int i = 0; i < randomPicker.length; i++) {
      randomQuotes.add(qu.getQuote(randomPicker[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    przypisanie(randomQuotes, randomPicker);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.gradientColor,
        body: Column(
          children: [
            Padding(
              child: Text(
                "Jarkowe bingo",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ), padding: EdgeInsets.fromLTRB(0, 70, 0, 15),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 15),
                Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed1 = !_hasBeenPressed1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed1 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[0],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed2 = !_hasBeenPressed2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed2 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[1],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed3 = !_hasBeenPressed3;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed3 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[2],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed4 = !_hasBeenPressed4;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed4 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[3],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed5 = !_hasBeenPressed5;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed5 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[4],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed6 = !_hasBeenPressed6;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed6 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[5],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(height: 30),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed7 = !_hasBeenPressed7;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed7 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[6],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed8 = !_hasBeenPressed8;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed8 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[7],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _hasBeenPressed9 = !_hasBeenPressed9;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary:
                                _hasBeenPressed9 ? Colors.blue : Colors.black,
                            onPrimary: AppColors.selectedColor,
                          ),
                          child: Column(children: <Widget>[
                            Expanded(
                                child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                randomQuotes[8],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))
                          ])),
                    ),
                  ],
                ),
                SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
