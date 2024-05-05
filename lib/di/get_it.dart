import 'package:get_it/get_it.dart';
import 'package:widgets/network/http/dio_service.dart';
import 'package:widgets/network/http/http_service.dart';
import 'package:widgets/port/product.dart';
import 'package:widgets/repositories/product_repository.dart';
import 'package:widgets/services/product_service.dart';


final getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<HttpService>(DioService('https://fakestoreapi.com'));
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());

}