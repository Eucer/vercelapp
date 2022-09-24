import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/admin/widgests/addProductScreen.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/models/product.dart';

import '../../../common/widgets/custom.button.dart';
import '../../../provider/theme.dart';
import '../ProductDetailsAdmin/screens/mobiles/Mobiles_productDetailsAdmin.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddProductScreen(),
      ),
    );
  }

  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return products == null
        ? Loader()
        : Scaffold(
            backgroundColor: currentTheme.isDarkTheme()
                ? GlobalVariables.darkOFbackgroundColor
                : GlobalVariables.greyBackgroundCOlor,
            body: Widgets(),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: currentTheme.isDarkTheme()
                    ? GlobalVariables.text1darkbackgroundColor
                    : Color(0XFF0D3B66),
              ),
              onPressed: navigateToAddProduct,
              tooltip: 'Add Productos',
              backgroundColor: currentTheme.isDarkTheme()
                  ? GlobalVariables.darkbackgroundColor
                  : GlobalVariables.backgroundColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }

  Padding Widgets() {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        color: currentTheme.isDarkTheme()
            ? GlobalVariables.darkOFbackgroundColor
            : GlobalVariables.greyBackgroundCOlor,
        child: GridView.builder(
          itemCount: products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            mainAxisSpacing: 0.0,
          ),
          itemBuilder: (context, index) {
            final productData = products![index];
            final currentTheme = Provider.of<ThemeProvider>(context);
            void _showModalSheet() {
              showModalBottomSheet(
                  context: context,
                  builder: (builder) {
                    return Container(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      height: 500,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Form(
                              child: Column(
                                children: [
                                  Container(
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables.darkbackgroundColor
                                        : GlobalVariables.backgroundColor,
                                    child: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0.0, top: 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: CachedNetworkImage(
                                            imageUrl: productData.images[0],
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 300.0,
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Deseas Eliminar este producto ? ',
                                    style: TextStyle(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .text1darkbackgroundColor
                                            : GlobalVariables
                                                .text1WhithegroundColor),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Row(
                                      children: [
                                        Container(
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'No',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Si',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }

            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MobilesProductDetailsAdmin(
                    product: productData,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  width: 110,
                  decoration: BoxDecoration(
                      color: currentTheme.isDarkTheme()
                          ? GlobalVariables.darkbackgroundColor
                          : GlobalVariables.backgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: _showModalSheet,
                                child: Icon(
                                  Icons.more_vert,
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: SingleProduct(
                          imagen: productData.images[0],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.darkbackgroundColor
                                  : GlobalVariables.backgroundColor,
                              padding: EdgeInsets.only(left: 10, right: 8),
                              child: Text(
                                productData.name,
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.text1darkbackgroundColor
                                      : GlobalVariables.text1WhithegroundColor,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.4,
                                  fontSize: 12.0,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(left: 9, top: 2),
                                  child: Text(
                                    productData.category,
                                    style: TextStyle(
                                      color: currentTheme.isDarkTheme()
                                          ? Color.fromARGB(255, 13, 95, 219)
                                          : Color.fromARGB(255, 11, 109, 255),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .darkbackgroundColor
                                            : GlobalVariables.backgroundColor,
                                        child: Text(
                                          'C' +
                                              productData.quantity.toString() +
                                              ' -',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? GlobalVariables
                                                    .text1darkbackgroundColor
                                                : GlobalVariables
                                                    .text1WhithegroundColor,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        color: currentTheme.isDarkTheme()
                                            ? GlobalVariables
                                                .darkbackgroundColor
                                            : GlobalVariables.backgroundColor,
                                        child: Text(
                                          ' \$${productData.price}',
                                          style: TextStyle(
                                            color: currentTheme.isDarkTheme()
                                                ? GlobalVariables
                                                    .text1darkbackgroundColor
                                                : GlobalVariables
                                                    .text1WhithegroundColor,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
