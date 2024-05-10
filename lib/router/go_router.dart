
import 'package:go_router/go_router.dart';
import 'package:widgets/entities/product_dto.dart';

import 'package:widgets/screens/home_screen.dart';
import 'package:widgets/screens/product_detail_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context,state){
      return const HomePage();
    },
    routes: [
      GoRoute(
        path: 'detail',
        builder: (context, state) {
          final product = state.extra as ProductToDisplay;
          return  ProductDeatilScreen(product: product,);
        },
        )
    ]
    ),
]);