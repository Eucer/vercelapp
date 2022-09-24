import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/services/seachServices.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/features/search/widgets/MostrarSerchendProductsWidgets.dart';

import 'package:v1douvery/models/product.dart';

import '../../../provider/theme.dart';

class SearchingPage extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  SearchingPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSeachedProduct();
  }

  fetchSeachedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

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
              child: SearchingWidget(),
            ),
            backgroundColor: GlobalVariables.appBarbackgroundColor,
          ),
        ),
        body: Container(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(left: 0),
              padding: EdgeInsets.only(left: 10),
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.borderColorsDarklv10
                          : GlobalVariables.borderColorsDarklv10,
                      width: 1),
                ),
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.darkbackgroundColor
                    : GlobalVariables.backgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          'Buscar : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.text1darkbackgroundColor
                                : GlobalVariables.text1WhithegroundColor,
                          ),
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            widget.searchQuery,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : GlobalVariables.text1WhithegroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            products == null
                ? const Loader()
                : Expanded(
                    flex: 2,
                    child: ListView.builder(
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                      addSemanticIndexes: false,
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        print('object : $index');
                        return GestureDetector(
                          child: products == null
                              ? const Loader()
                              : SerchendWidgetsProducts(
                                  product: products![index],
                                ),
                        );
                      },
                    ),
                  ),
          ]),
        ));
  }
}

class SearchingWidget extends StatefulWidget {
  const SearchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchingWidget> createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
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
    return SizedBox(
      child: Container(
        height: 55,
        width: double.infinity,
        color: GlobalVariables.appBarbackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Material(
              child: TextFormField(
                cursorColor: Colors.grey,
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
                  hintText: 'Buscar articulos...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color:
                        currentTheme.isDarkTheme() ? Colors.grey : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
