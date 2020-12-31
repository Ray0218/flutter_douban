import 'package:dio/dio.dart';

class HttpConfig {
  static const String baseUrl = "https://douban.uieee.com/v2";
  static const int timeOut = 5000;
}

class HttpRequest {
  static final BaseOptions baseOption = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeOut);
  static final Dio dio = Dio(baseOption);

  static Future<T> request<T>(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      Interceptor inter}) async {
    final option = Options(method: method);

// 全局拦截器
// 、、创建全局默认拦截器

    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        return options;
      },
      onResponse: (e) {
        return e;
      },
      onError: (e) {
        return e;
      },
    );

    List<Interceptor> inters = [dInter];

    if (inter != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);

//发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: option);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
