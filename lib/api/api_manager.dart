import 'package:dio/dio.dart';
import 'package:news/data/models/NewsResponse/NewsReponse.dart';
import 'package:news/data/models/sourceReponse/SourceModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org",
      connectTimeout: Duration(seconds: 60),
    ),
  );
  ApiManager._() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
      ),
    );
  }
  static ApiManager? _instance;

  static ApiManager getInstance() {
    return _instance ??= ApiManager._();
  }

  Future<SourceModel> getSources(String categoryId) async {
    final response = await _dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {"apiKey": "25f7cd4776214267a1925c5aee3eff97","category":categoryId},
    );
    return SourceModel.fromJson(response.data);
  }
  Future<NewsReponse> getNews(String sourceId , {required int page}) async {
    final response = await _dio.get(
      "/v2/everything",
      queryParameters: {"apiKey": "25f7cd4776214267a1925c5aee3eff97",
      "sources":sourceId,
        "pageSize":"10",
        "page":"$page"
      },
    );
    return NewsReponse.fromJson(response.data);
  }
  Future<NewsReponse> searchNews(String query) async {
    final response = await _dio.get(
      "/v2/everything",
      queryParameters: {"apiKey": "25f7cd4776214267a1925c5aee3eff97",
      "q":query,
      },
    );
    return NewsReponse.fromJson(response.data);
  }
}
