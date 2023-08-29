import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'package:learn_leap/core/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'home_card.dart';

class HomeCardSection extends StatelessWidget {
  const HomeCardSection({super.key, required this.section});
  final String section;
  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ...List.generate(
          10,
          (index) => ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: HomeCard(
              index: index,
              image: Faker().image.image(keywords: [section]),
            ),
          ),
        ),
      ],
    );
  }
}
