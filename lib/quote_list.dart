import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';
import 'dart:math';

import 'package:bingo/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'landing_page.dart';

class QuoteList extends StatefulWidget {
  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  var _textController = TextEditingController();
  var txt = TextEditingController();
  final data = GetStorage();
  List<String> quoteski = [];
  String input = "";

  @override
  void initState() {
    qu.getQuotesPreference().then(updateQuote);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (quoteski.isEmpty) {
      quoteski = qu.quotesList;
    }
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
          child: quoteski.length > 0
              ? ListView.separated(
                  itemCount: quoteski.length,
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 80),
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: AppColors.buttonColor,
                      //shadowColor: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          child: ListTile(
                            tileColor: AppColors.buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Text(
                              quoteDisplay(index),
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          background: Container(
                            color: Colors.orangeAccent,
                            child: Align(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Edytuj",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " Usuń",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                          onDismissed: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              setState(() {
                                quoteski.removeAt(index);
                                qu.saveQuotesPreference(quoteski);
                              });
                            }
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                if (quoteski.length > 10 &&
                                    DismissDirection.endToStart == direction) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: const Text("Potwierdzenie"),
                                    content: const Text(
                                        "Czy jesteś pewien, że chcesz usunąć ten element?"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text("USUŃ")),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("ANULUJ"),
                                      ),
                                    ],
                                  );
                                } else if (DismissDirection.endToStart ==
                                    direction) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    title: const Text("Błąd"),
                                    content: const Text(
                                        "Nie możesz usunąć tego elementu. Minimalna ilośc elementów która musi być w liście to 10"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("ANULUJ"),
                                      ),
                                    ],
                                  );
                                } else {
                                  _textController.text = quoteDisplay(index);
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      title: Text("Edytuj cytat"),
                                      content: TextField(
                                        controller: _textController,
                                        onSubmitted: (value) {
                                          setState(() {
                                            quoteEdited(
                                                _textController.text, index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: AppColors.buttonColor,
                                              onPrimary: Colors.white,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                quoteEdited(
                                                    _textController.text,
                                                    index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Edytuj")),
                                      ]);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8,
                    );
                  },
                )
              : Center(
                  child: Text('Brak danych'),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.selectedColor,
          child: Icon(Icons.add),
          onPressed: () {
            if (quoteski.length >= 30) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      title: const Text("Błąd"),
                      content: const Text(
                          "Maksymalna ilość elementów w liście to 30. Proszę usunąć starsze elementy."),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("ANULUJ"),
                        ),
                      ],
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text("Wprowadź cytat"),
                        content: TextField(
                          controller: _textController,
                          onSubmitted: (value) {
                            setState(() {
                              quoteSave(_textController.text);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.buttonColor,
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  quoteSave(_textController.text);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Dodaj")),
                        ]);
                  });
            }
          },
        ),
      ),
    );
  }

  void updateQuote(List<String>? quoteski) {
    setState(() {
      this.quoteski = quoteski!;
    });
  }

  String quoteDisplay(index) {
    String finalQuote = quoteski[index];
    finalQuote = finalQuote.replaceAll("-\n", "");
    finalQuote = finalQuote.replaceAll("\n", " ");
    return (finalQuote);
  }

  void quoteSave(quote) {
    var finalQuote = "";
    if(quote.length >= 30){
      quote = quote.substring(0, 30);
    }
    print(quote);
    List<String> quoteCharList = quote.split("");
    int counter = 0;
    bool enterReady = false;
    bool toLong = false;
    bool firstLetter = true;
    for (int i = 0; i < quoteCharList.length; i++) {
      counter += 1;
      if (firstLetter) {}

      if (counter >= 6) {
        enterReady = true;
      }

      if (counter >= 15) {
        toLong = true;
      }

      if (quoteCharList[i] == '.'){
        firstLetter = true;
      }

      if (firstLetter &&
          quoteCharList[i].toUpperCase().contains(RegExp(r'[A-Z]'))) {
        quoteCharList[i] = quoteCharList[i].toUpperCase();
        firstLetter = false;
      }
      if (quoteCharList[i] == " " && enterReady) {
        finalQuote += "\n";
        enterReady = false;
        toLong = false;
        counter = 0;
      } else if (toLong) {
        finalQuote += "-\n";
        finalQuote += quoteCharList[i];
        enterReady = false;
        toLong = false;
        counter = 0;
      } else {
        finalQuote += quoteCharList[i];
      }
    }
    quoteski.add(finalQuote);
    qu.saveQuotesPreference(quoteski);
    _textController.clear();
  }

  void quoteEdited(quote, index) {
    print(quote);
    var finalQuote = "";
    if(quote.length >= 30){
      quote = quote.substring(0, 30);
    }
    List<String> quoteCharList = quote.split("");
    int counter = 0;
    bool enterReady = false;
    bool toLong = false;
    bool firstLetter = true;
    for (int i = 0; i < quoteCharList.length; i++) {
      counter += 1;
      if (firstLetter) {}

      if (counter >= 6) {
        enterReady = true;
      }

      if (counter >= 15) {
        toLong = true;
      }

      if (quoteCharList[i] == '.'){
        firstLetter = true;
      }

      if (firstLetter &&
          quoteCharList[i].toUpperCase().contains(RegExp(r'[A-Z]'))) {
        quoteCharList[i] = quoteCharList[i].toUpperCase();
        firstLetter = false;
      }
      if (quoteCharList[i] == " " && enterReady) {
        finalQuote += "\n";
        enterReady = false;
        toLong = false;
        counter = 0;
      } else if (toLong) {
        finalQuote += "-\n";
        finalQuote += quoteCharList[i];
        enterReady = false;
        toLong = false;
        counter = 0;
      } else {
        finalQuote += quoteCharList[i];
      }
    }
    quoteski[index] = finalQuote;
    qu.saveQuotesPreference(quoteski);
    _textController.clear();
  }
}
