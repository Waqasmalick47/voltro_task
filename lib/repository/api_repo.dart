import 'package:voltro_task/models/covid_summery.dart';

abstract class ApiRepo {
  Future<CovidSummery> getcovidsummery();
}
