// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvmaze_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TVMazeApi implements TVMazeApi {
  _TVMazeApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://api.tvmaze.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<TVShow>> getShowList(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/shows',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TVShow.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<TVShow>> searchShows(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': query};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/search/shows',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => TVShow.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<TVShow> getShow(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/shows/$id?embed=episodes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TVShow.fromJson(_result.data);
    return value;
  }
}
