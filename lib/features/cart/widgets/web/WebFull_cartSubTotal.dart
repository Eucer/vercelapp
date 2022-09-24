import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/provider/user_provider.dart';

class WebFull_CartSubtotal extends StatelessWidget {
  const WebFull_CartSubtotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Container(
      width: MediaQuery.of(context).size.width / 1.7,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Envio :          ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'Gratis',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 4, 161, 17),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Subtotal :  ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '\$$sum',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Que mas necesitas?  ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Enabled'))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
