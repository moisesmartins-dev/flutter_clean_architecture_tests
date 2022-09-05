import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:flutter_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:flutter_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:flutter_clean_architecture/modules/search/domain/usercases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

main() {
  late MockSearchRepository repository = MockSearchRepository();
  late SearchByTextImpl usecase = SearchByTextImpl(repository);
  test('Should return Result Search list', () async {
    when(() => repository.search(any())).thenAnswer((_) async => const Right(<ResultSearch>[]));
    final result = await usecase('moises');
    expect(result.getOrElse(() => []), isA<List<ResultSearch>>());
  });

  test('Should return exception if text is invalid', () async {
    when(() => repository.search(any())).thenAnswer((_) async => const Right(<ResultSearch>[]));
    final result = await usecase('');
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
