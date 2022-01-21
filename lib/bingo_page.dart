import 'package:bingo/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({Key? key}) : super(key: key);

  @override
  _BingoPageState createState() => _BingoPageState();
}

class _BingoPageState extends State<BingoPage> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hasBeenPressed = !_hasBeenPressed;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _hasBeenPressed ? Colors.blue : Colors.black,
                    onPrimary: AppColors.selectedColor,
                  ),
                  child: Text(
                    'Test',
                    style: GoogleFonts.nunito(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
