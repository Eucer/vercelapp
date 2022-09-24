import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/SeveryCrypto/Screens/SeveryScreen.dart';
import 'package:v1douvery/provider/theme.dart';

class CartCrypto extends StatelessWidget {
  const CartCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              GlobalVariables.cryptoLogo[1],
                            ),
                            // picked file
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                'Severy ... ',
                                style: GoogleFonts.roboto(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                'Quieres ver de los beneficios de la moneda ?',
                                style: GoogleFonts.roboto(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 00),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeveryScrenn(),
                              ),
                            ),
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 11,
                                  left: 10,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Ver ahora ',
                                        style: TextStyle(
                                          color: currentTheme.isDarkTheme()
                                              ? Color.fromARGB(255, 2, 112, 214)
                                              : Color(0xff10375C),
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Icon(
                                          Iconsax.arrow_circle_right,
                                          size: 16,
                                          color: currentTheme.isDarkTheme()
                                              ? Color.fromARGB(255, 2, 112, 214)
                                              : Color(
                                                  0xff10375C,
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
