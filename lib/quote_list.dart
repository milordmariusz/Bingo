import 'dart:async';
import 'dart:core';
import 'dart:core';

import 'package:bingo/quotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'landing_page.dart';

class QuoteList extends StatefulWidget {
  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  var _textController = TextEditingController();
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
        appBar: AppBar(title: Text("Lista cytatów")),
        body: quoteski.length > 0
            ? ListView.builder(
                itemCount: quoteski.length,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: Card(
                      child: ListTile(
                        title: Text('${quoteski[index]}'),
                        onLongPress: () {
                          setState(() {
                            quoteski.removeAt(index);
                            qu.saveQuotesPreference(quoteski);
                          });
                        },
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              quoteski.removeAt(index);
                              qu.saveQuotesPreference(quoteski);
                            });
                          },
                        ),
                      ),
                    ),
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                          )
                        ],
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        quoteski.removeAt(index);
                        qu.saveQuotesPreference(quoteski);
                      });
                    },
                  );
                },
              )
            : Center(
                child: Text('Brak danych'),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
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
                            quoteski.add(_textController.text);
                            qu.saveQuotesPreference(quoteski);
                            _textController.clear();
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      actions: <Widget>[
                        FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                quoteski.add(_textController.text);
                                qu.saveQuotesPreference(quoteski);
                                _textController.clear();
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text("Dodaj")),
                      ]);
                });
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
}
