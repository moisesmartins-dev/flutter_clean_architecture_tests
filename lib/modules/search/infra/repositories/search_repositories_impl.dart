import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/modules/search/infra/datasources/search_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDatasource searchDatasource;

  SearchRepositoryImpl(this.searchDatasource);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try {
      final result = await searchDatasource.getSearch(searchText);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError(e.toString()));
    }
  }
}
