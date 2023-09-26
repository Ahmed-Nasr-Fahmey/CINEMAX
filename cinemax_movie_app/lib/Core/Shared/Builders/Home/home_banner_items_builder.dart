
import 'package:flutter/material.dart';

import '../../widgets/home_banner_item.dart';
import '../../widgets/indicator.dart';

class HomeBunnerItemsBuilder extends StatefulWidget {
  const HomeBunnerItemsBuilder({super.key});

  @override
  State<HomeBunnerItemsBuilder> createState() => _HomeBunnerItemsBuilderState();
}

class _HomeBunnerItemsBuilderState extends State<HomeBunnerItemsBuilder> {
  int selectedItem = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          height: 140,
          child: PageView.builder(
            clipBehavior: Clip.none,
            controller: PageController(
              initialPage: selectedItem,
              keepPage: true,
              viewportFraction: 0.7,
            ),
            onPageChanged: (index) {
              setState(() {
                selectedItem = index;
              });
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              var scale = selectedItem == index ? 1.1 : 0.8;
              return TweenAnimationBuilder(
                curve: Curves.ease,
                duration: const Duration(milliseconds: 350),
                tween: Tween(begin: scale, end: scale),
                child: const HomeBannerItem(),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value.toDouble(),
                    child: child,
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (index) => Indicator(
                isActive: selectedItem == index ? true : false,
              ),
            ),
          ],
        )
      ],
    );
  }
}
