import 'package:flutter/material.dart';
import 'package:voltro_task/utils/textstyle.dart';

class StatsWidget extends StatelessWidget {
  final String title;
  final value;
  const StatsWidget({Key key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.medium10grey,
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: AppTextStyle.regular16grey,
        ),
      ],
    );
  }
}
