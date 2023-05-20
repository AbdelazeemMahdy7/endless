import 'package:dio/dio.dart';
import 'package:endless/constant/strings.dart';


class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 20 * 1000),
      receiveTimeout: const Duration(seconds: 20 * 1000),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getPlacesSuggestion(String places,
      String sessionToken) async {
    try{
      Response response = await dio.get(
        suggestionBaseUrl,
        queryParameters: {
          'input' : places,
          'type':'address',
          'components':'country:eg',
          'key':googleApiKey,
          'sessiontoken':sessionToken ,
        },
      );
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    }catch(error){
      print(error.toString());
      return [];
    }
  }
}