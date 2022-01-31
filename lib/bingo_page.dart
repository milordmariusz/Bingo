import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:bingo/app_colors.dart';
import 'package:bingo/quotes.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_page.dart';
import 'quote_list.dart';

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
  bool _hasBeenLoaded = false;

  List<String> randomQuotes = [];
  List<String> quoteski = [];

  @override
  void initState() {
    print("jeden");
    qu.getQuotesPreference().then(updateQuote);
    super.initState();
  }

  void updateQuote(List<String>? quoteski) {
    print("trzy");
    setState(() {
      this.quoteski = quoteski!;
      print("dwa");
      var x = randomGenerator();
      przypisanie(x);
    });
  }

  List<int> randomGenerator() {

    if (quoteski.isEmpty){
      quoteski = qu.quotesList;
    }
    var randomPicker = List<int>.generate(quoteski.length - 1, (i) => i + 1)
      ..shuffle();
    return randomPicker;
  }

  void przypisanie(randomPicker) {
    if (randomQuotes != quoteski && quoteski.isEmpty == false){
      randomQuotes.clear();
    }
    for (int i = 0; i < randomPicker.length; i++) {
      randomQuotes.add(quoteski[randomPicker[i]]);
    }
  }

  void checkWin() {
    if (_hasBeenPressed1 &&
        _hasBeenPressed2 &&
        _hasBeenPressed3 &&
        _hasBeenPressed4 &&
        _hasBeenPressed5 &&
        _hasBeenPressed6 &&
        _hasBeenPressed7 &&
        _hasBeenPressed8 &&
        _hasBeenPressed9) {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: 'Gratulacje',
          confirmBtnText: 'Play Again',
          confirmBtnColor: AppColors.selectedColor,
          cancelBtnText: 'Quit',
          showCancelBtn: true,
          onCancelBtnTap: () {
            Navigator.popUntil(context, (route) => route.isFirst);
            _hasBeenPressed1 = false;
            _hasBeenPressed2 = false;
            _hasBeenPressed3 = false;
            _hasBeenPressed4 = false;
            _hasBeenPressed5 = false;
            _hasBeenPressed6 = false;
            _hasBeenPressed7 = false;
            _hasBeenPressed8 = false;
            _hasBeenPressed9 = false;
            randomQuotes.clear();
            randomGenerator();
          },
          onConfirmBtnTap: () {
            Navigator.pop(context);
            _hasBeenPressed1 = false;
            _hasBeenPressed2 = false;
            _hasBeenPressed3 = false;
            _hasBeenPressed4 = false;
            _hasBeenPressed5 = false;
            _hasBeenPressed6 = false;
            _hasBeenPressed7 = false;
            _hasBeenPressed8 = false;
            _hasBeenPressed9 = false;
            randomQuotes.clear();
            //randomGenerator();
            var x = randomGenerator();
            przypisanie(x);
            setState(() {});
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("cztery");
    if (_hasBeenLoaded == false){
      updateQuote(quoteski);
      _hasBeenLoaded = true;
    }
    print(quoteski);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.bgColor,
              AppColors.gradientColor,
            ],
          )),
          child: Column(
            children: [
              Padding(
                child: Text(
                  "Bingo",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 70, 0, 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 15),
                  Column(
                    children: [
                      SizedBox(height: 30),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed1 = !_hasBeenPressed1;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed2 = !_hasBeenPressed2;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed3 = !_hasBeenPressed3;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed4 = !_hasBeenPressed4;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed5 = !_hasBeenPressed5;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed6 = !_hasBeenPressed6;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed7 = !_hasBeenPressed7;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed8 = !_hasBeenPressed8;
                                checkWin();
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
                        width: (MediaQuery.of(context).size.width - 50) / 3,
                        height: (MediaQuery.of(context).size.width - 50) / 3,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _hasBeenPressed9 = !_hasBeenPressed9;
                                checkWin();
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
      ),
    );
  }
}
