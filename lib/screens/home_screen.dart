

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'package:widget_compose/mocks/products.dart';

import 'package:widgets/entities/product.dart';
import 'package:widgets/mock/product.dart';
import 'package:widgets/network/http/dio_service.dart';
import 'package:widgets/repositories/product_repository.dart';
import 'package:widgets/services/product_service.dart';
import 'package:widgets/widgets/compounds/jumbotron/home_jumbotron.dart';
import 'package:widgets/widgets/compounds/navbar/home_nav.dart';
import 'package:widgets/widgets/compounds/sections/catalog.dart';


import '../port/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IProductService service;

  List<List<ProductToDisplay>> products = [];
  List<String> categories = [];

  _HomePageState() {
    final http = DioService('https://fakestoreapi.com');
    final repo = ProductRepository(http);
    service = ProductService(repo);

    getProducts();
  }

  void getProducts() async {
    final categories = await service.getCategories();
    final productsFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productsFetchers);

    setState(() {
      this.categories = categories;
      this.products = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const HomeNavbar(),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        HomeJumbotron(
                            imageUrl: categoryImages[categories[index]]!,
                            title: categories[index].toUpperCase(),
                            buttonTitle: 'ViewCollection'
                        ),
                        Catalog(title: 'All products',products: products[index]),
                        const SizedBox(height: 24,)
                      ],
                    );
                  },
                )
              ),
            ],
          ),
        ),
    );
  }
}