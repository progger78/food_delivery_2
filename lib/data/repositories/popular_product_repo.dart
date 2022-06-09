

import 'package:food_delivery_2/data/api/api_client.dart';
import 'package:food_delivery_2/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});
 
  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.popularProductUrl);

  }
}