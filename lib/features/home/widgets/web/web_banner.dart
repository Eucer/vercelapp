import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart'
    show DotsDecorator, DotsIndicator;
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class Web_BannerWidget extends StatefulWidget {
  const Web_BannerWidget({Key? key}) : super(key: key);

  @override
  State<Web_BannerWidget> createState() => _Web_BannerWidgetState();
}

class _Web_BannerWidgetState extends State<Web_BannerWidget> {
  double scrollPosition = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 2),
          child: ClipRRect(
            child: Container(
                color: Colors.white,
                width: 1500,
                child: CarouselSlider(
                  items: GlobalVariables.carouselImagesWeb.map((i) {
                    return Builder(
                        builder: (BuildContext context) => CachedNetworkImage(
                              imageUrl: i,
                              fit: BoxFit.fill,
                              width: 1500,
                            ));
                  }).toList(),
                  options: CarouselOptions(
                    height: 340,
                    viewportFraction: 1,
                    aspectRatio: 1 / 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                )),
          ),
        ),
        IdicatorBanner(controller: _controller, current: _current),
      ],
    );
  }
}

class IdicatorBanner extends StatelessWidget {
  const IdicatorBanner({
    Key? key,
    required CarouselController controller,
    required int current,
  })  : _controller = controller,
        _current = current,
        super(key: key);

  final CarouselController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: GlobalVariables.carouselImagesWeb
                  .asMap()
                  .entries
                  .map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 7.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Colors.white)
                          .withOpacity(_current == entry.key ? 1 : 0.2),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
