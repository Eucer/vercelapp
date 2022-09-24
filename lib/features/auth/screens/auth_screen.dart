import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view_with_custom_page_navigator/contained_tab_bar_view_with_custom_page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/custom.button.dart';
import 'package:v1douvery/common/widgets/custom_textfiels.dart';
import 'package:v1douvery/common/widgets/custon_button.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/auth/services/auth_service.dart';

import '../../../provider/theme.dart';
import '../../home/responsive/responsive_layaout.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  //*Sign Up User
  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  //*Sign In  User
  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: GlobalVariables.appBarbackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onDoubleTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ResponsiveLayaout(),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, right: 0, left: 30),
                    child: Container(
                      alignment: Alignment.center,
                      width: 250,
                      height: 100,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://res.cloudinary.com/douvery/image/upload/v1659297990/LOGO/of4ya7v8cmrg0mg8us0c.png',
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentTheme.isDarkTheme()
                                  ? GlobalVariables.darkbackgroundColor
                                  : GlobalVariables.backgroundColor,
                            ),
                            padding: const EdgeInsets.all(8.0),
                            height: 400,
                            child: ContainedTabBarView(
                              initialIndex: 0,
                              tabs: [
                                Text(
                                  'Iniciar Session',
                                  style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                                Text(
                                  'Crear Cuenta',
                                  style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables
                                            .text1darkbackgroundColor
                                        : GlobalVariables
                                            .text1WhithegroundColor,
                                  ),
                                ),
                              ],
                              views: [
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 20),
                                    color: currentTheme.isDarkTheme()
                                        ? GlobalVariables.darkbackgroundColor
                                        : GlobalVariables.backgroundColor,
                                    child: Form(
                                      key: _signInFormKey,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            CustomTextField(
                                              controller: _emailController,
                                              hintText: 'Email',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomTextField(
                                              controller: _passwordController,
                                              hintText: 'Password',
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            CustomnButton(
                                              text: 'Sign Up',
                                              color: currentTheme.isDarkTheme()
                                                  ? Color.fromARGB(
                                                      255, 58, 92, 124)
                                                  : GlobalVariables
                                                      .secondaryColor,
                                              onTap: () {
                                                if (_signInFormKey.currentState!
                                                    .validate()) {
                                                  signInUser();
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    150, 0, 0, 0),
                                                fontSize: 20,
                                              ),
                                            ),
                                            Container(
                                              color: currentTheme.isDarkTheme()
                                                  ? GlobalVariables
                                                      .darkbackgroundColor
                                                  : GlobalVariables
                                                      .backgroundColor,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            '← Regresar')),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 20),
                                  color: currentTheme.isDarkTheme()
                                      ? GlobalVariables.darkbackgroundColor
                                      : GlobalVariables.backgroundColor,
                                  child: Form(
                                    key: _signUpFormKey,
                                    child: Column(
                                      children: [
                                        CustomTextField(
                                          controller: _nameController,
                                          hintText: 'Name',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          controller: _emailController,
                                          hintText: 'Email',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          controller: _passwordController,
                                          hintText: 'Password',
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomnButton(
                                          text: 'Sign Up',
                                          color: currentTheme.isDarkTheme()
                                              ? Color.fromARGB(255, 58, 92, 124)
                                              : GlobalVariables.secondaryColor,
                                          onTap: () {
                                            if (_signUpFormKey.currentState!
                                                .validate()) {
                                              signUpUser();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              // ignore: avoid_print
                              onChange: (index) => print(index),
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
        ),
      )),
    );
  }
}
