import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/modules/search/external/datasources/github_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);
  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(githubResult),
          statusCode: 200,
          requestOptions: RequestOptions(path: '/test', baseUrl: "teste"),
        ));
    final result = datasource.getSearch('moises martins');
    expect(result, completes);
  });
}
