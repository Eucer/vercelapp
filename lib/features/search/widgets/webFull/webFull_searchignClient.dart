import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:v1douvery/NAV/web/Web_appBarIcons.dart';
import 'package:v1douvery/NAV/web/Web_bottomNavSearchTitle.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/services/seachServices.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/features/search/widgets/MostrarSerchendProductsWidgets.dart';

import 'package:v1douvery/models/product.dart';

import 'webFull_MostrarSerchendProductsWidgets.dart';

class WebFull_searchingPage extends StatefulWidget {
  final String searchQuery;
  WebFull_searchingPage({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<WebFull_searchingPage> createState() => _WebFull_searchingPageState();
}

class _WebFull_searchingPageState extends State<WebFull_searchingPage> {
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
          builder: (context) => WebFull_searchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        builder: (context, child) {
          return Scaffold(
            body: child,
          );
        },
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: GlobalVariables.greyBackgroundCOlor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: Center(
                child: Web_AppBarIcons(),
              ),
            ),
            body: Container(
              child: Container(
                child: Column(children: [
                  WebFull_NavCategory(),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(12, 0, 0, 0), width: 1),
                      ),
                      color: GlobalVariables.backgroundColor,
                    ),
                    child: Container(
                      padding: EdgeInsets.only(left: 370),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 160,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Text(
                                  'Buscar :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: 100,
                                  child: Text(
                                    widget.searchQuery,
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  products == null
                      ? const Loader()
                      : Expanded(
                          flex: 1,
                          child: Container(
                            width: 1200,
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
                                      : WebFullSerchendWidgetsProducts(
                                          product: products![index],
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                ]),
              ),
            )));
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
          builder: (context) => WebFull_searchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                onFieldSubmitted: navigateToSearchingScreen,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                  hintText: 'Buscar articulos...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
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
