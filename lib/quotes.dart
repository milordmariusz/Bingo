import 'package:shared_preferences/shared_preferences.dart';
class Quotes {
  List<String> quotesList = [
    "Linux",
    "Programiści",
    "Piwo",
    "Microsoft",
    "Rząd",
    "Społeczeństwo",
    "Studenci",
    "Podatki",
    "Sprzęt\nza 40k",
    "Władze\nuczelni",
    "Promowanie\nkanału",
    "Próbuję\ntylko\nzainteresować",
    "Egzamin",
    "Narzekanie\nna\nedukację",
    "Dzieci",
    "20 min\nbez\nwykładu",
    "Bezpieczeństwo",
    "Auta",
    "Kontenery",
    "Ciężka\npraca",
    "Świnia",
    "Krzyk",
    "Kto pyta\nnie błądzi"
  ];

  Future<bool> saveQuotesPreference (List<String> quotes) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('quote', quotes);
    return prefs.commit();
  }

  Future <List<String>?> getQuotesPreference() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? quotesl = prefs.getStringList('quote');
    return quotesl;
  }

  String getQuote(i) => quotesList[i];
}

