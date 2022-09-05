import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:flutter_clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:flutter_clean_architecture/modules/search/infra/repositories/search_repositories_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchDatasource extends Mock implements SearchDatasource {}

main() {
  final MockSearchDatasource datasource = MockSearchDatasource();
  final SearchRepositoryImpl repository = SearchRepositoryImpl(datasource);
  test('Deve retornar uma lista de ResultSearch', () async {
    when(() => datasource.getSearch(any())).thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('moises');
    expect(result | [], isA<List<ResultSearch>>());
  });
  test('Deve retornar um erro se o datasource falhar', () async {
    when(() => datasource.getSearch(any())).thenThrow(Exception());
    final result = await repository.search('moises');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
