import 'package:flutter/material.dart';
import 'package:voltro_task/models/covid_summery.dart';
import 'package:voltro_task/repository/api_repo.dart';
import 'package:voltro_task/repository/prod_repo.dart';

class SummeryProvider with ChangeNotifier {
  final ApiRepo apirepo = ProdRepo();
  CovidSummery _covidsummery;

  CovidSummery get getcovidSummery => _covidsummery;

  SummeryProvider() {
    getsummery();
  }

  void getsummery() async {
    var data = await apirepo.getcovidsummery();
    if (data != null) {
      _covidsummery = data;
      notifyListeners();
    }
  }
}
