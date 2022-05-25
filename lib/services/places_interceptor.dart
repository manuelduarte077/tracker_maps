import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessTokenPlaces =
      'pk.eyJ1IjoibWFudWVsZHVhcnRlMDc3IiwiYSI6ImNsM2l6a3dtazAxdXczY3Fma2Z6b21mOHQifQ.q5FyDMXrsfPceza4AtwYcQ';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'limit': 7,
      'language': 'es',
      'access_token': accessTokenPlaces,
    });

    super.onRequest(options, handler);
  }
}
