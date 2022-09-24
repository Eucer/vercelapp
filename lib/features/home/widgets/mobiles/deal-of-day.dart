import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/mobiles_productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/provider/theme.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: product!,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: currentTheme.isDarkTheme()
                        ? GlobalVariables.darkbackgroundColor
                        : GlobalVariables.backgroundColor,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            'Deal of the day',
                            style: TextStyle(
                              fontSize: 20,
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : GlobalVariables.text1WhithegroundColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: CachedNetworkImage(
                            imageUrl: product!.images[0],
                            height: 235,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            r'$' + product!.price.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text2darkbackgroundColor
                                  : GlobalVariables.text1WhithegroundColor,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, right: 40),
                          child: Text(
                            product!.marca,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.text1darkbackgroundColor
                                  : GlobalVariables.text1WhithegroundColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ).copyWith(left: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'See all deals',
                            style: TextStyle(
                              color: currentTheme.isDarkTheme()
                                  ? Colors.cyan[500]
                                  : Colors.cyan[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }
}
