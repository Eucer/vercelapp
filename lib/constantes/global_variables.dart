import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/provider/theme.dart';

String uri = 'http://10.0.0.7:3000';

class GlobalVariables {
  //* COLORES
  final currentTheme = Provider.of<ThemeProvider>;

  static const appBarbackgroundColor = Color.fromARGB(255, 13, 71, 161);
  static const primaryColor = Color.fromARGB(255, 13, 71, 161);
  static const secondaryColor = Color(0xff2c3e50);
  static const buttomColor = Color(0xff1a49ab);

  static const backgroundNavBarColor = Colors.white;
  static const selectedNavBarColor = Color(0xffebecee);
  static const unselectedNavBarColor = Colors.black87;
  static const colorTextBlckLight = Color.fromARGB(197, 0, 0, 0);
  static const colorTextBlckBold = Colors.black;
  static const colorTextGreylv180 = Color.fromARGB(180, 0, 0, 0);
  static const colorTextGreylv50 = Color.fromARGB(50, 0, 0, 0);
  static const colorTextGreylv30 = Color.fromARGB(30, 0, 0, 0);
  static const colorTextGreylv20 = Color.fromARGB(20, 0, 0, 0);
  static const colorTextGreylv15 = Color.fromARGB(15, 0, 0, 0);
  static const colorTextGreylv10 = Color.fromARGB(10, 0, 0, 0);
  static const colorTextWhiteLight = Colors.white;
  static const colorRosaRojVivo = Color(0xffF8485E);
  static const rgbGradient = Color(0xff30475E);
  static const bottomNavHome = Color(0xffe84118);
  static const colorPriceDetailsPrin = Color(0xffe5431c);
  static const colorPriceSecond = Color(0xff0B347B);
  static const colorViolet = Color.fromARGB(234, 93, 2, 238);
  static const colorstarsrating = Color(0xffe67E22);
  static const colorgreen = Color.fromARGB(255, 4, 161, 17);
  static const colorUser = Color.fromARGB(255, 3, 207, 207);
  static const colorYelow = Color(0xffFBD316);

  //* DartColors
  static const darkOFbackgroundColor = Color(0xff393E46);
  static const darkbackgroundColor = Color(0xff222831);
  static const text1darkbackgroundColor = Color.fromARGB(214, 241, 245, 249);
  static const text2darkbackgroundColor = Color.fromARGB(255, 241, 245, 249);
  static const text20darkbackgroundColor = Color(0xffe9ebee);
  static const text1GreygroundColor = Color.fromARGB(255, 83, 83, 83);
  static const colorArtNewdarkbackgroundColor = Color.fromARGB(255, 155, 0, 44);

  //* WhitheColors
  static const greyBackgroundCOlor = Color(0xfff1f5f9);
  static const backgroundColor = Color(0xffFDFEFE);
  static const text1WhithegroundColor = Color(0xff1C2833);
  static const text2WhithegroundColor = Color.fromARGB(255, 12, 17, 22);

  static const colorArtNewWhithebackgroundColor = Color(0xffC70039);

  //*BorderColors
  static const borderColorsDarklv10 = Color.fromARGB(17, 252, 252, 252);
  static const borderColorsWhithelv10 = Color.fromARGB(10, 0, 0, 0);
  static const borderColorsDarklv20 = Color.fromARGB(90, 252, 252, 252);
  static const borderColorsWhithelv20 = Color.fromARGB(157, 0, 0, 0);
  //* NavBAR
  static const navBardarkbackgroundColor = Color(0xff222831);
  static const navBarbackgroundColor = Colors.white;

  static const loaderColor = LinearGradient(
    colors: [
      Color.fromARGB(255, 6, 194, 122),
      Color.fromARGB(255, 255, 255, 255),
    ],
    stops: [0.5, 1.0],
  );

  static const gradientColorsBrands = LinearGradient(
    colors: [
      Color.fromARGB(50, 0, 0, 0),
      Color.fromARGB(50, 0, 0, 0),
    ],
    stops: [0.5, 1.0],
  );

//* OrdersColors
  static const colorOrden0 = Color(0xff00ADB5);
  static const colorOrden1 = Color(0xff005691);
  static const colorOrden2 = Color(0xff6D9886);
  static const colorOrden3 = Color(0xff59CE8F);
  static const colorOrden4 = Color(0xffC21010);

// STATIC IMAGES
  static List<String> carouselImagesMobil = [
    'https://res.cloudinary.com/douvery/image/upload/v1656633027/agsubxxt7iwp654lpvcr.png',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static List<String> carouselImagesWeb = [
    'https://res.cloudinary.com/douvery/image/upload/v1661850780/banner/ytlhajitpuposk3gvrta.png',
    'https://res.cloudinary.com/douvery/image/upload/v1660209142/banner/o1zskktmuzkbq5lsuqyf.png',
    'https://m.media-amazon.com/images/I/7174eQSxuFL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/61tX6L542kL._SX3000_.jpg',
  ];

  static List<String> cryptoLogo = [
    'https://res.cloudinary.com/douvery/image/upload/v1659002119/CryptosLogos/fsiudupkd2zjj0a175r5.png',
    'https://res.cloudinary.com/douvery/image/upload/v1659002119/CryptosLogos/bbrhtrtufbam7litta9m.png',
  ];

  static List<String> marcaApple = [
    'https://res.cloudinary.com/douvery/image/upload/v1660326424/s/ozgiqc4id6tpuqb9d5jo.png',
    'https://res.cloudinary.com/douvery/image/upload/v1660326909/s/tylsuiylapczqat0yhkw.png',
  ];

  static const List<Map<String, String>> categoryTitle = [
    {
      'title': 'Mobiles',
    },
    {
      'title': 'Ropas',
    },
    {
      'title': 'Hogar',
    },
    {
      'title': 'Electronics',
    },
    {
      'title': '   Nuevos',
    },
  ];
}


//todo: add