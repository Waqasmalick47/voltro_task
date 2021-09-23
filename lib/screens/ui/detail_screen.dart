import 'package:flutter/material.dart';
import 'package:voltro_task/models/covid_summery.dart';
import 'package:voltro_task/screens/widgets/stats_widget.dart';
import 'package:voltro_task/utils/colors.dart';
import 'package:voltro_task/utils/constants.dart';
import 'package:voltro_task/utils/textstyle.dart';

class DetailScreen extends StatelessWidget {
  final Countries countries;
  const DetailScreen({Key key, this.countries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 230,
              color: Theme.of(context).primaryColor,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${countries.country}',
                        style: AppTextStyle.regular24white,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        Constants.caronastats,
                        style: AppTextStyle.medium10white,
                      )
                    ],
                  ),
                  Positioned(
                    left: 15,
                    top: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: StatsWidget(
                              title: Constants.totalcases,
                              value: '${countries.totalConfirmed}',
                            )),
                        Expanded(
                            flex: 1,
                            child: StatsWidget(
                              title: Constants.totalDeaths,
                              value: '${countries.totalDeaths}',
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: StatsWidget(
                              title: Constants.newcases,
                              value: '${countries.newConfirmed}',
                            )),
                        Expanded(
                            flex: 1,
                            child: StatsWidget(
                              title: Constants.newDeaths,
                              value: '${countries.newDeaths}',
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: StatsWidget(
                              title: Constants.newrecovered,
                              value: '${countries.newRecovered}',
                            )),
                        Expanded(
                          flex: 1,
                          child: StatsWidget(
                            title: Constants.totalrecovered,
                            value: '${countries.totalRecovered}',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
