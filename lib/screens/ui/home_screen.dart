import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voltro_task/providers/summery_provider.dart';
import 'package:voltro_task/screens/widgets/list_widget.dart';
import 'package:voltro_task/utils/colors.dart';
import 'package:voltro_task/utils/constants.dart';
import 'package:voltro_task/utils/routes.dart';
import 'package:voltro_task/utils/textstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child:
              Consumer(builder: (context, SummeryProvider summeryProvider, _) {
            if (summeryProvider.getcovidSummery == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        Constants.world.toUpperCase(),
                        style: AppTextStyle.appbarTitle,
                      ),
                      Text(
                        '${summeryProvider.getcovidSummery.global.totalConfirmed}',
                        style: AppTextStyle.appbarTitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: summeryProvider.getcovidSummery.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListWidget(
                        countries:
                            summeryProvider.getcovidSummery.countries[index],
                        ontap: () => Navigator.pushNamed(
                          context,
                          Routes.detail,
                          arguments:
                              summeryProvider.getcovidSummery.countries[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
