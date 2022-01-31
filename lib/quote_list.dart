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
  List <String> quoteski = [];

  @override
  void initState(){
    qu.getQuotesPreference().then(updateQuote);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if (quoteski.isEmpty){
      quoteski = qu.quotesList;
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: _textController,
          ),
        ),
        body: quoteski.length > 0
            ? ListView.separated(
                itemCount: quoteski.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${quoteski[index]}'),
                    onLongPress: (){
                      setState(() {
                        quoteski.removeAt(index);
                        qu.saveQuotesPreference(quoteski);
                      });
                    },
                    trailing: Icon(Icons.remove_circle_outline),
                  );
                },
          separatorBuilder: (BuildContext context, int index)=>
              const Divider(
                color:Colors.black,
              ),
        )
            : Center(
                child: Text('Brak danych'),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            setState((){
              quoteski.add(_textController.text);
              qu.saveQuotesPreference(quoteski);
              _textController.clear();
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
