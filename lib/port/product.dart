
import 'package:widgets/entities/product_dto.dart';
import 'package:widgets/models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getByCategory(String category);
  Future<List<String>> getCategories();
}

abstract class IProductService {
  Future<List<ProductToDisplay>> getByCategory(String category);
  Future<List<String>> getCategories();
}