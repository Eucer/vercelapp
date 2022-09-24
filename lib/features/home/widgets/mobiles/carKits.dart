import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class CarKitsProductOne extends StatelessWidget {
  const CarKitsProductOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: GlobalVariables.backgroundColor,
        width: 550,
        height: 250.0,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            // Max Size Widget
            Positioned(
              top: 30,
              left: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg'),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
