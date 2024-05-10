
import 'package:widgets/di/get_it.dart';
import 'package:widgets/entities/product_dto.dart';
import 'package:widgets/port/product.dart';

class ProductService extends IProductService {
  final IProductRepository repository = getIt.get<IProductRepository>();

  @override
  Future<List<ProductToDisplay>> getByCategory(String category) async {
    final rawProducts = await repository.getByCategory(category);
    return rawProducts.map((product) => ProductToDisplay(
      id: product.id.toString(), 
      category: product.category!, 
      name: product.title!, 
      imageUrl: product.image!, 
      price: product.price!.toDouble(),
      description: product.description
      )).toList();
      
  }

  @override
  Future<List<String>> getCategories() async {
    return await repository.getCategories();
  }

}