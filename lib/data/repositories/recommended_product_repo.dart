import '/data/api/api_client.dart';
import '/utils/app_constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient});
 
  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.recommendedProductUrl);

  }
}