import 'package:dio/dio.dart';
import 'package:kstream/models/film_model.dart';
import 'package:kstream/utils/custom_log.dart';
import 'package:kstream/utils/dio_service.dart';

class HomeRepository {
  Future<FilmModel> getFilms() async {
    try {
      Response response = await DioService().getData(url: '/films');
      return FilmModel.fromJson(response.data);
    } on DioError catch (apiError) {
      logInfo(apiError.response!.data);
      throw apiError;
    } catch (error) {
      logInfo(error.toString());
      throw error;
    }
  }
}
