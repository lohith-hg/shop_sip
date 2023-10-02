import 'package:shop_sip/features/product/blocs/product_state.dart';
import 'package:shop_sip/features/product/models/beer.dart';
import 'package:test/test.dart';

void main() {
  group('ProductInitialState', () {
    test('prop will be empty list', () {
      const initialState = ProductInitialState();
      expect(initialState.props, isEmpty);
    });
  });

  group('ProductLoadingState', () {
    test('props will contain the message', () {
      const loadingState = ProductLoadingState(message: 'Loading Beers...');
      expect(loadingState.props, [loadingState.message]);
    });
  });

  group('ProductSuccessState', () {
    test('props contains a list of beers', () {
      final beers = [Beer(id: 1, name: 'Beer 1'), Beer(id: 2, name: 'Beer 2')];
      final successState = ProductSuccessState(beers: beers);
      expect(successState.props, beers);
    });
  });

  group('ProductErrorState', () {
    test('props contain the error message', () {
      const errorState = ProductErrorState(error: 'Some error');
      expect(errorState.props, [errorState.error]);
    });
  });
}
