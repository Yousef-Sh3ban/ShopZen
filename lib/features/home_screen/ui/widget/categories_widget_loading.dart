import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class CategoriesLoadingWidget extends StatelessWidget {
  const CategoriesLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> categories = [
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("View All",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: FadeOut(
            child: Row(
              children: categories.map(
                (category) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 47,
                            width: 47,
                          ),
                          const SizedBox(height: 4,),
                          SizedBox(
                            child: Center(
                              child: Container(
                                width: 36,
                                height: 17,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xFFEBEFFF),
                                ),
                              ),
                            ),
                          )
                        ],
                      ).redacted(
                        configuration: RedactedConfiguration(defaultBorderRadius: const BorderRadius.all(Radius.circular(8))),
                        context: context,
                        redact: true,
                      ),
                      category is SizedBox
                          ? const SizedBox(
                              width: 16,
                            )
                          : const SizedBox()
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
