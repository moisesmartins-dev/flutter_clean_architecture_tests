import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository searchRepository;

  SearchByTextImpl(this.searchRepository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {
    if (searchText.isEmpty || searchText == null) {
      return Left(InvalidTextError());
    }
    return searchRepository.search(searchText);
  }
}
