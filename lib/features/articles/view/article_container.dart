import 'package:alen/features/core/color_ui.dart';
import 'package:flutter/material.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        constraints: BoxConstraints(minHeight: 180),
        decoration: BoxDecoration(
            color: ColorsUi.blue, borderRadius: BorderRadius.circular(45.0)),
        margin: EdgeInsets.only(
          left: 19.0,
          right: 15.0,
          top: 18.0,
          bottom: 18.0,
        ),
        padding: EdgeInsets.only(left: 45.0, top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme:',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Description:',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
