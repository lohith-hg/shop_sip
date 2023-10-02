import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shop_sip/features/product/blocs/product_event.dart';
import 'package:shop_sip/features/product/blocs/product_state.dart';
import '../models/beer.dart';
import '../repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  int page = 1;
  bool isFetching = false;

  ProductBloc({
    required this.productRepository,
  }) : super(const ProductInitialState()) {
    on<ProductFetchEvent>(_handleProductFetchEvent);
  }

  void _handleProductFetchEvent(
      ProductFetchEvent event, Emitter<ProductState> emit) async {
      try {
        if (page == 1) {
          emit(const ProductLoadingState(message: 'Loading Beers...'));
        }else{
          emit(const ProductLoadingState(message: 'Loading More Beers...'));
        }
        final response = await productRepository.getBeers(page: page);
        if (response is http.Response) {
          if (response.statusCode == 200) {
            final beers = jsonDecode(response.body) as List;
            if (beers.isEmpty) {
              emit(const ProductErrorState(error: 'No more products to load'));
            } else {
              emit(ProductSuccessState(
                beers: beers.map((beer) => Beer.fromJson(beer)).toList(),
              ));
              page++;
            }
          } else {
            emit(const ProductErrorState(error: 'Failed to load beers'));
          }
        } else if (response is String) {
          emit(ProductErrorState(error: response));
        }
      } catch (e) {
        emit(ProductErrorState(error: e.toString()));
      }
  }
}
