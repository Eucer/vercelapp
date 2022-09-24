import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/custom_textfiels.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/constantes/utils.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';

import '../../../provider/theme.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productMarcaController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productMarcaController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Hogar',
    'Electronics',
    'Ropas',
    'Estufa',
    'Books',
    'Tenis',
    'Moda',
    'Zapatos',
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
        marca: productMarcaController.text,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: currentTheme.isDarkTheme()
          ? GlobalVariables.darkOFbackgroundColor
          : GlobalVariables.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Color(
                0XFF0D3B66,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add Productos',
                  style: GoogleFonts.lato(
                    color: Color(0xffFCFCFC),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: currentTheme.isDarkTheme()
              ? GlobalVariables.darkbackgroundColor
              : GlobalVariables.backgroundColor,
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  images.isNotEmpty
                      ? Container(
                          child: CarouselSlider(
                            items: images.map(
                              (i) {
                                return Builder(
                                  builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.contain,
                                    height: 300,
                                  ),
                                );
                              },
                            ).toList(),
                            options: CarouselOptions(
                              height: 400,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 8),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            color: currentTheme.isDarkTheme()
                                ? GlobalVariables.borderColorsDarklv20
                                : GlobalVariables.borderColorsWhithelv20,
                            borderType: BorderType.RRect,
                            radius: Radius.circular(10),
                            dashPattern: [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.folder_open,
                                    size: 40,
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables.borderColorsDarklv20
                                        : GlobalVariables
                                            .borderColorsWhithelv20,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select images Productos ',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: productNameController,
                    hintText: 'Nombre del Producto',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: productMarcaController,
                    hintText: 'Marca',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: descriptionController,
                    hintText: 'Descripcion ',
                    maxLines: 7,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: priceController,
                    hintText: 'Precio',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: quantityController,
                    hintText: 'Quantity',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownButton2(
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Colors.yellow,
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.redAccent,
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                        items: productCategories.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? GlobalVariables.text1darkbackgroundColor
                                    : GlobalVariables.text1WhithegroundColor,
                              ),
                            ),
                          );
                        }).toList(),
                        value: category,
                        onChanged: (String? newVal) {
                          category = newVal!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CustomnButton(
                      text: 'Sell',
                      onTap: sellProduct,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
