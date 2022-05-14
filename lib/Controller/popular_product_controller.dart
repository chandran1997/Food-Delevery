import 'package:ecommarce_app/Models/products_models.dart';
import 'package:get/get.dart';

import 'package:ecommarce_app/Data/respository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({
    required this.popularProductRepo,
  });

  List<dynamic> _popularProductList = [];
  //we can get the data anywhere by using get method
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    // call from respository
    Response response = await popularProductRepo.getPopularProductList();
    //check correct response or not
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      //add and retrun the list of object
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update(); //this update more like setstate method
    } else {}
  }
}
