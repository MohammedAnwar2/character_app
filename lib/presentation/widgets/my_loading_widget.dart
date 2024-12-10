import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    int itemCount = 60;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width < 600
            ? 2
            : width < 800
                ? 3
                : width < 1200
                    ? 4
                    : width < 1500
                        ? 5
                        : 6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 2 / 2.7,
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}

class MyLoadingWidget2 extends StatelessWidget {
  const MyLoadingWidget2({super.key, this.itemCount = 60});
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return SliverGrid.builder(
      // padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width < 600
            ? 2
            : width < 800
                ? 3
                : width < 1200
                    ? 4
                    : width < 1500
                        ? 5
                        : 6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 2 / 2.7,
      ),
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
