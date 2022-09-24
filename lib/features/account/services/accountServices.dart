import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v1douvery/constantes/error_handling.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/constantes/utils.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/provider/user_provider.dart';
import 'package:http/http.dart' as http;

import '../../auth/responsive/authResponsivelayout.dart';

class AccountServices {
  Future<List<Order>> fetchMyOrders({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Order> orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void logOut(BuildContext context) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      // ignore: use_build_context_synchronously
      Navigator.of(context, rootNavigator: true).push(
        // ensures fullscreen
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return WebFullResponsiveLayaout();
          },
        ),
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
