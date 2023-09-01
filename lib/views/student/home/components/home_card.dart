import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.index,
    required this.image,
  });
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 200,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.white),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                height: 200 * 0.75,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AppText.regular(
                  "CSC222",
                  color: Colors.white,
                ),
              ),
              AppText.small(
                "Paid",
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
