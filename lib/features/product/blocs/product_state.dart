import 'package:equatable/equatable.dart';

import '../models/beer.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitialState extends ProductState {
  const ProductInitialState();

  @override
  List<Object?> get props => [];
}

class ProductLoadingState extends ProductState {
  final String message;

  const ProductLoadingState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ProductSuccessState extends ProductState {
  final List<Beer> beers;

  const ProductSuccessState({
    required this.beers,
  });

  @override
  List<Object?> get props => beers;
}

class ProductErrorState extends ProductState {
  final String error;

  const ProductErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
