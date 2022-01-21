import 'package:bingo/app_colors.dart';
import 'package:bingo/quotes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Quotes qu = Quotes();

var randomPicker = List<int>.generate(qu.quotesList.length-1, (i)=>i+1)..shuffle();

List<String> randomQuotes = [];

void przypisanie(List<String> randomQuotes, List<int> randomPicker){
  for(int i=0;i<randomPicker.length;i++) {
    randomQuotes.add(qu.getQuote(i));
  }
}

class BingoPage extends StatefulWidget {
  const BingoPage({Key? key}) : super(key: key);

  @override
  _BingoPageState createState() => _BingoPageState();
}
class _BingoPageState extends State<BingoPage> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    przypisanie(randomQuotes,randomPicker);
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: <Widget>[
            SizedBox(width: 15),
            Column(
              children: [
                SizedBox(height: 60),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                    child: Column(
                      children: < Widget>[
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              randomQuotes[0],
                              style: GoogleFonts.nunito(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        )
                      ]
                    )
                ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[1],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[2],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: [
                SizedBox(height: 60),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[3],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[4],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[5],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: [
                SizedBox(height: 60),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[6],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[7],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width:120.0,
                  height: 120.0,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _hasBeenPressed ? Colors.blue : Colors.black,
                        onPrimary: AppColors.selectedColor,
                      ),
                      child: Column(
                          children: < Widget>[
                            Expanded(
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    randomQuotes[8],
                                    style: GoogleFonts.nunito(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                            )
                          ]
                      )
                  ),
                ),
              ],
            ),
            SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
