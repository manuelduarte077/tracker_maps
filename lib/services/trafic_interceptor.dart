import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoibWFudWVsZHVhcnRlMDc3IiwiYSI6ImNsM2l6a3dtazAxdXczY3Fma2Z6b21mOHQifQ.q5FyDMXrsfPceza4AtwYcQ';

class TrafficInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });

    super.onRequest(options, handler);
  }
}
