import 'package:flutter/material.dart';
import 'package:v1douvery/NAV/mobiles/centerSearchNav.dart';

import 'package:v1douvery/constantes/global_variables.dart';

import 'package:v1douvery/features/category/screens/webFull_categoryDealsScreen.dart';

class BottomNavSearchTitle extends StatelessWidget {
  const BottomNavSearchTitle({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    MaterialPageRoute(
      builder: (context) => WebFullCategoryDealsScreen(
        category: category,
      ),
      settings: RouteSettings(
        arguments: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CenterSearchNav(),
        Web_NavCategory(),
      ],
    );
  }
}

class Web_NavCategory extends StatelessWidget {
  const Web_NavCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(right: 0),
        color: GlobalVariables.secondaryColor,
        child: Container(
          margin: EdgeInsets.only(left: 100),
          child: ListView.builder(
            itemCount: GlobalVariables.categoryTitle.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => WebFullCategoryDealsScreen(
                      category: GlobalVariables.categoryTitle[index]['title']!,
                    ),
                    settings: RouteSettings(
                      arguments: GlobalVariables.categoryTitle[index]['title']!,
                    ),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          GlobalVariables.categoryTitle[index]['title']!,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class WebFull_NavCategory extends StatelessWidget {
  const WebFull_NavCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(right: 0),
        color: GlobalVariables.secondaryColor,
        child: Container(
          margin: EdgeInsets.only(left: 300),
          child: ListView.builder(
            itemCount: GlobalVariables.categoryTitle.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => WebFullCategoryDealsScreen(
                      category: GlobalVariables.categoryTitle[index]['title']!,
                    ),
                    settings: RouteSettings(
                      arguments: GlobalVariables.categoryTitle[index]['title']!,
                    ),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          GlobalVariables.categoryTitle[index]['title']!,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
