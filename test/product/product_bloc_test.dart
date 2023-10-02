import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shop_sip/features/product/blocs/product_bloc.dart';
import 'package:shop_sip/features/product/blocs/product_event.dart';
import 'package:shop_sip/features/product/blocs/product_state.dart';
import 'package:shop_sip/features/product/repository/product_repository.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  group('ProductBloc', () {
    late ProductBloc productBloc;
    late MockProductRepository mockProductRepository;

    setUp(() {
      mockProductRepository = MockProductRepository();
      productBloc = ProductBloc(productRepository: mockProductRepository);
    });

    tearDown(() {
      productBloc.close();
    });

    test('initial state is ProductInitialState', () {
      expect(productBloc.state, const ProductInitialState());
    });

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoadingState, ProductSuccessState] when data is successfully loaded',
      build: () {
        return productBloc;
      },
      act: (bloc) {
        when(mockProductRepository.getBeers(page: 1)).thenAnswer(
            (_) async => http.Response('[{"name": "Beer 1"}]', 200));
        bloc.add(const ProductFetchEvent());
      },
      expect: () => [
        const ProductLoadingState(message: 'Loading Beers...'),
        const TypeMatcher<ProductSuccessState>(),
      ],
      verify: (_) {
        verify(mockProductRepository.getBeers(page: 1)).called(1);
      },
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoadingState, ProductErrorState] when an error occurs',
      build: () {
        return productBloc;
      },
      act: (bloc) {
        when(mockProductRepository.getBeers(page: 1))
            .thenThrow(Exception('Some error'));
        bloc.add(const ProductFetchEvent());
      },
      expect: () => [
        const ProductLoadingState(message: 'Loading Beers...'),
        const ProductErrorState(error: 'Exception: Some error'),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoadingState, ProductSuccessState] with empty list when HTTP response is empty',
      build: () {
        return productBloc;
      },
      act: (bloc) {
        when(mockProductRepository.getBeers(page: 1))
            .thenAnswer((_) async => http.Response('[]', 200));
        bloc.add(const ProductFetchEvent());
      },
      expect: () => [
        const ProductLoadingState(message: 'Loading Beers...'),
        const ProductErrorState(error: 'No more products to load'),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoadingState, ProductSuccessState] with additional products on subsequent fetch',
      build: () {
        return productBloc;
      },
      act: (bloc) {
        when(mockProductRepository.getBeers(page: 1)).thenAnswer(
            (_) async => http.Response('[{"name": "Product 1"}]', 200));
        when(mockProductRepository.getBeers(page: 2)).thenAnswer((_) async =>
            http.Response(
                '[{"name": "Product 2"},{"name": "Product 2"}]', 200));
        bloc.add(const ProductFetchEvent());
        bloc.add(const ProductFetchEvent());
      },
      expect: () => [
        const ProductLoadingState(message: 'Loading Beers...'),
        const TypeMatcher<ProductSuccessState>(),
        const ProductLoadingState(message: 'Loading More Beers...'),
        const TypeMatcher<ProductSuccessState>(),
      ],
    );
  });
}
