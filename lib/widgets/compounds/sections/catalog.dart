import 'package:flutter/cupertino.dart';

import 'package:widgets/entities/product_dto.dart';
import 'package:widgets/widgets/compounds/list/product_list.dart';
import 'package:widgets/widgets/elements/text/text_title.dart';

class Catalog extends StatelessWidget {

  final List<ProductToDisplay> products;
  final OnSelectProduct? onSelectProduct;

  final String title;

  const Catalog({super.key, required this.products, required this.title, this.onSelectProduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: TextTitle(title: title),
        ),
        ProductList(products: products,onSelectProduct: onSelectProduct,)
      ],
    );
  }
  
}