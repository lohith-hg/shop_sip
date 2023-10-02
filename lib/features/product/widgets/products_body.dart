import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_sip/features/product/widgets/product_card.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../router.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_event.dart';
import '../blocs/product_state.dart';
import '../models/beer.dart';
import '../view/product_detail_screen.dart';

class ProductsBody extends StatefulWidget {
  @override
  _ProductsBodyState createState() => _ProductsBodyState();
}

class _ProductsBodyState extends State<ProductsBody> {
  final List<Beer> _beers = [];
  final ScrollController _scrollController = ScrollController();

  Future<void> _refreshProducts() async {
    BlocProvider.of<ProductBloc>(context)
      ..isFetching = true
      ..add(const ProductFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: RefreshIndicator(
          onRefresh: _refreshProducts,
          color: primaryColor,
          child: Center(
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, beerState) {
                if (beerState is ProductLoadingState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: secondaryColor,
                    content: Text(
                      beerState.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ));
                } else if (beerState is ProductSuccessState &&
                    beerState.beers.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No more beers')));
                } else if (beerState is ProductErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(beerState.error)));
                  BlocProvider.of<ProductBloc>(context).isFetching = false;
                }
                return;
              },
              builder: (context, beerState) {
                if (beerState is ProductInitialState ||
                    beerState is ProductLoadingState && _beers.isEmpty) {
                  return const CircularProgressIndicator(
                    color: primaryColor,
                  );
                } else if (beerState is ProductSuccessState) {
                  _beers.addAll(beerState.beers);
                  BlocProvider.of<ProductBloc>(context).isFetching = false;
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                } else if (beerState is ProductErrorState && _beers.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<ProductBloc>(context)
                            ..isFetching = true
                            ..add(const ProductFetchEvent());
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                      const SizedBox(height: 15),
                      Text(beerState.error, textAlign: TextAlign.center),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        router.go('/profile');
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(
                            left: 12, top: 20, bottom: 16),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Image.asset("assets/Images/Icon.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 10, bottom: 15),
                      child: Text(
                        "Time to Cheers! Choose your beer...",
                        style: largebodyTextStyle.copyWith(
                            color: const Color(0xFFAFB2B5)),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        padding:
                            const EdgeInsets.only(left: 12, right: 12, top: 15),
                        controller: _scrollController
                          ..addListener(() {
                            if (_scrollController.offset ==
                                    _scrollController
                                        .position.maxScrollExtent &&
                                !BlocProvider.of<ProductBloc>(context)
                                    .isFetching) {
                              BlocProvider.of<ProductBloc>(context)
                                ..isFetching = true
                                ..add(const ProductFetchEvent());
                            }
                          }),
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              context.goNamed("productDetail",
                                  extra: _beers[index]);
                            },
                            child: ProductCard(_beers[index])),
                        itemCount: _beers.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
