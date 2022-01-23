import 'package:bingo/bingo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bingo/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bingo/bingo_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        height: size.height,
        width: size.width,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bingo!',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  color: AppColors.selectedColor,
                  fontSize: 65,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 300),
            Text(
              'Gramy!',
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.8,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.buttonColor,
                  onPrimary: AppColors.selectedColor,
                ),
                child: Text(
                  'Generuj planszę',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BingoPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
