import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voltro_task/screens/widgets/list_widget.dart';
import 'package:provider/provider.dart';
import 'package:voltro_task/providers/summery_provider.dart';
import 'package:voltro_task/utils/colors.dart';
import 'package:voltro_task/utils/constants.dart';
import 'package:voltro_task/utils/routes.dart';
import 'package:voltro_task/utils/textstyle.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var focusNode = new FocusNode();
  String search;

  TextEditingController searchCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (currentFocus.hasPrimaryFocus) {
      FocusScope.of(context).requestFocus(focusNode);
    }
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
                  margin: EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: searchCOntroller,
                      focusNode: focusNode,
                      style: TextStyle(fontSize: 17),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            search = value;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: blackColor,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: Constants.search,
                          labelStyle: GoogleFonts.roboto(),
                          hintStyle: GoogleFonts.roboto()),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: summeryProvider.getcovidSummery.countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      Widget widget = SizedBox();
                      if (searchCOntroller.text.isNotEmpty &&
                          summeryProvider
                              .getcovidSummery.countries[index].country
                              .toLowerCase()
                              .contains(searchCOntroller.text)) {
                        widget = ListWidget(
                          countries:
                              summeryProvider.getcovidSummery.countries[index],
                          ontap: () => Navigator.pushNamed(
                            context,
                            Routes.detail,
                            arguments: summeryProvider
                                .getcovidSummery.countries[index],
                          ),
                        );
                      }
                      return widget;
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
