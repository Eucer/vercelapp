import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/IconButton.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/custom_textfiels.dart';
import 'package:v1douvery/common/widgets/stars.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/services/accountServices.dart';
import 'package:v1douvery/features/admin/screens/adminScreens.dart';
import 'package:v1douvery/features/admin/servicios/adminServices.dart';
import 'package:v1douvery/provider/user_provider.dart';

import '../../Drawer/screen/mobiles_drawerScreen.dart';

class AccountsBrands extends StatefulWidget {
  AccountsBrands({Key? key}) : super(key: key);

  @override
  State<AccountsBrands> createState() => _AccountsBrandsState();
}

class _AccountsBrandsState extends State<AccountsBrands> {
  final TextEditingController productNameController = TextEditingController();
  List<UserProvider>? user;
  final AdminServices adminServices = AdminServices();

  @override
  Widget build(BuildContext context) {
    void _showModalSheet() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: 500,
              child: Form(
                child: Column(
                  children: [
                    Text('Editar Nombre :'),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: productNameController,
                      hintText: 'Escribe aqui',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomnButton(
                      text: 'Sell',
                      onTap: () {},
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.all(40.0),
            );
          });
    }

    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Color(
                0XFF0D3B66,
              ),
              flexibleSpace: Container(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Icon(Icons.admin_panel_settings),
                        Text(
                          user.name,
                          style: GoogleFonts.lato(
                            color: Color(0xffFCFCFC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: GestureDetector(
                        child: Icon(
                          IconlyLight.logout,
                          color: GlobalVariables.colorTextWhiteLight,
                        ),
                        onTap: () => AccountServices().logOut(context),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              toolbarHeight: 60,
            ),
            ContainerNavOpci(),
          ],
        ),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Container(
          color: GlobalVariables.backgroundColor,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                  gradient: GlobalVariables.loaderColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Row(
                            children: [
                              Text(
                                user.name,
                                style: GoogleFonts.lato(
                                    fontSize: 30, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Stars(rating: 5),
                              Text(
                                '( 5 ) ' + '199',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.black12,
                      child: Row(
                        children: [
                          IconButton(
                            icon: GestureDetector(
                              child: Icon(
                                IconlyLight.heart,
                                color: GlobalVariables.backgroundColor,
                              ),
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: GestureDetector(
                              child: Icon(
                                IconlyLight.arrowRightCircle,
                                color: GlobalVariables.backgroundColor,
                              ),
                            ),
                            onPressed: _showModalSheet,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xffF6F6F6),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Color.fromARGB(12, 0, 0, 0)),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Nombre :  ',
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: GlobalVariables.colorTextBlckLight),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  user.name,
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: GlobalVariables.colorTextBlckBold),
                                ),
                              ),
                              IconButton(
                                icon: GestureDetector(
                                  child: Icon(
                                    IconlyLight.edit,
                                    color: GlobalVariables.colorTextBlckLight,
                                  ),
                                ),
                                onPressed: _showModalSheet,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Color.fromARGB(12, 0, 0, 0)),
                            ),
                          ),
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Background :     ',
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: GlobalVariables.colorTextBlckLight),
                              ),
                              Container(
                                width: 30,
                                height: 20,
                                decoration: const BoxDecoration(
                                  gradient: GlobalVariables.loaderColor,
                                ),
                              ),
                              IconButton(
                                icon: GestureDetector(
                                  child: Icon(
                                    IconlyLight.edit,
                                    color: GlobalVariables.colorTextBlckLight,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
