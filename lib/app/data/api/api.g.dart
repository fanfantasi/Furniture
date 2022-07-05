// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://192.168.1.10:8081/apis';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> login(email, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (password != null) {
      _data.fields.add(MapEntry('password', password));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> registration(uid, email, displayname, avatar) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (uid != null) {
      _data.fields.add(MapEntry('uid', uid));
    }
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (displayname != null) {
      _data.fields.add(MapEntry('displayname', displayname));
    }
    if (avatar != null) {
      _data.fields.add(MapEntry('avatar', avatar));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user/add',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> category() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/category',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> promo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/promo',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itemsreference({page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/reference?page=${page}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itemsrecomendation({page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/reference?page=${page}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itemsbycategory({page, categoryid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (categoryid != null) {
      _data.fields.add(MapEntry('categoryid', categoryid.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/itembycategory?page=${page}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> imagesitem({itemid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (itemid != null) {
      _data.fields.add(MapEntry('itemid', itemid.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/images',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itemsrelated({page, categoryid, itemid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (categoryid != null) {
      _data.fields.add(MapEntry('categoryid', categoryid.toString()));
    }
    if (itemid != null) {
      _data.fields.add(MapEntry('itemid', itemid.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/related?page=${page}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itemsearch({page, search}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (search != null) {
      _data.fields.add(MapEntry('search', search));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/search?page=${page}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> itembyid({itemid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (itemid != null) {
      _data.fields.add(MapEntry('itemid', itemid.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/itembyid',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> ratingbyitem({page, itemid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (itemid != null) {
      _data.fields.add(MapEntry('itemid', itemid.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/ratings',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> province() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/address/province',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> kota({kdprov}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (kdprov != null) {
      _data.fields.add(MapEntry('kdprov', kdprov.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/address/kota',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> kec({kdkota}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (kdkota != null) {
      _data.fields.add(MapEntry('kdkota', kdkota.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/address/kec',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> kel({kdkec}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    if (kdkec != null) {
      _data.fields.add(MapEntry('kdkec', kdkec.toString()));
    }
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/address/kel',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
