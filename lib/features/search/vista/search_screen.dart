import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/widgets/carousel_recent_search_widgets.dart';
import 'package:v1douvery/features/search/widgets/recomendYou.dart';

import 'package:v1douvery/features/search/widgets/searchignClient.dart';

import '../../../provider/theme.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Container(
            child: CustomnIconsButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text20darkbackgroundColor
                    : GlobalVariables.text20darkbackgroundColor,
                size: 20,
              ),
              onPressed: () => Navigator.pop(
                context,
              ),
            ),
          ),
          title: FadeInLeft(
            duration: const Duration(milliseconds: 300),
            from: 10,
            child: Text(
              'Buscador',
              style: TextStyle(
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text20darkbackgroundColor
                    : GlobalVariables.text20darkbackgroundColor,
              ),
            ),
          ),
          actions: [
            CustomnIconsButton(
              icon: const Icon(IconlyLight.category),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: SearchWidget(),
          ),
          backgroundColor: GlobalVariables.appBarbackgroundColor,
        ),
      ),
      body: ListView(
        children: const [
          CarouselRecentSearch(),
        ],
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  void navigateToSearchingScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(children: [
        SizedBox(
          child: Container(
            height: 55,
            width: double.infinity,
            color: GlobalVariables.appBarbackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Material(
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    autofocus: true,
                    onFieldSubmitted: navigateToSearchingScreen,
                    style: TextStyle(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.text1darkbackgroundColor
                          : GlobalVariables.text1WhithegroundColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                      hintText: 'Busca tu articulo ...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: currentTheme.isDarkTheme()
                            ? Colors.grey
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
