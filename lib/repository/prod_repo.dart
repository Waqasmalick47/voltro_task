import 'dart:io';
import 'package:dio/dio.dart';
import 'package:voltro_task/models/covid_summery.dart';
import 'package:voltro_task/repository/api_repo.dart';
import 'package:voltro_task/repository/api_urls.dart';
import 'package:voltro_task/screens/widgets/toast_widget.dart';

class ProdRepo implements ApiRepo {
  Dio dio = Dio();

  @override
  Future<CovidSummery> getcovidsummery() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        try {
          final response = await dio.get(
            AppUrls.baseurl + AppUrls.summery,
          );
          print(response);
          if (response.statusCode == 200) {
            return CovidSummery.fromJson(response.data);
          } else {
            ToastWidget.showToast('Somthing went wrong');
            throw Exception('Somthing went wrong');
          }
        } on DioError catch (e) {
          print(e.response);
          return null;
        }
      }
    } on SocketException catch (_) {
      ToastWidget.showToast('Please Check your internet Connection');
    }
    return null;
  }
}
