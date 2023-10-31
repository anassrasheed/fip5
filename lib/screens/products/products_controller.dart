import 'dart:convert';

import 'package:fip5/screens/products/product_model.dart';
import 'package:fip5/utils/helpers/general_status_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var products = [].obs;
  late var statusModel = GeneralStatusModel().obs;

  void getProducts() async {
    statusModel.value.updateStatus(GeneralStatus.waiting);
    var url = Uri.parse('https://fakestoreapi.com/products/100');
    var response = await http.get(
      url,
    );

    if ((response.statusCode >= 200 && response.statusCode < 300)) {
      if (response.body.isEmpty) {
        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("No Result Found");
        return;
      }
      List result = json.decode(response.body);

      for (int index = 0; index < result.length; index++) {
        products.add(ProductModel.fromMap(result[index]));
      }
      statusModel.value.updateStatus(GeneralStatus.success);

      return;
    }
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError("Something went wrong");
  }

  get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;

  get isError => statusModel.value.status.value == GeneralStatus.error;

  get isSuccess => statusModel.value.status.value == GeneralStatus.success;
}
