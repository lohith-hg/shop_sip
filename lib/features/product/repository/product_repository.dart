import 'package:http/http.dart' as http;

class ProductRepository {
  static final ProductRepository _productRepository = ProductRepository._();
  static const int _perPage = 10;

  ProductRepository._();

  factory ProductRepository() {
    return _productRepository;
  }

  Future<dynamic>? getBeers({
    required int page,
  }) async {
    try {
      return await http.get(
        Uri.parse(
          'https://api.punkapi.com/v2/beers?page=$page&per_page=$_perPage',
        ),
      );
    } catch (e) {
      return e.toString();
    }
  }
}
