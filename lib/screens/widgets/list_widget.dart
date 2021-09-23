import 'package:flutter/material.dart';
import 'package:voltro_task/models/covid_summery.dart';
import 'package:voltro_task/utils/colors.dart';
import 'package:voltro_task/utils/textstyle.dart';

class ListWidget extends StatelessWidget {
  final VoidCallback ontap;
  final Countries countries;
  const ListWidget({Key key, this.countries, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${countries.country}',
                    style: AppTextStyle.regular14black,
                  ),
                  Text(
                    '${countries.totalConfirmed}',
                    style: AppTextStyle.regular14black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              height: 2,
              color: grey.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
