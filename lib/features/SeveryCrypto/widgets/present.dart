import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PrensetCrypto extends StatelessWidget {
  const PrensetCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FadeInUp(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              color: Colors.white70,
              child: Text('Severy'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeInLeft(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.red,
                    child: Text('Severy'),
                  ),
                ),
                FadeInRight(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.purple,
                    child: Text('Severy'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
