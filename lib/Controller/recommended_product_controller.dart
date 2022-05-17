import 'package:ecommarce_app/Models/products_models.dart';
import 'package:get/get.dart';

import 'package:ecommarce_app/Data/respository/popular_product_repo.dart';

import '../Data/respository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({
    required this.recommendedProductRepo,
  });

  List<dynamic> _recommendedProductList = [];
  //we can get the data anywhere by using get method
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    // call from respository
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    //check correct response or not
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      //add and retrun the list of object
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update(); //this update more like setstate method
    } else {
      print("could not get  products Recommended");
    }
  }
}
