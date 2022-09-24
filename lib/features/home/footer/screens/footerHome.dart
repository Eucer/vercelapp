import 'package:flutter/material.dart';

class FooterHome extends StatelessWidget {
  const FooterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        color: Color.fromARGB(230, 41, 61, 80),
      ),
    );
  }
}
