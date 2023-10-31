import 'dart:convert';

import 'package:fip5/screens/products/product_model.dart';
import 'package:fip5/screens/products/products_controller.dart';
import 'package:fip5/utils/helpers/general_status_model.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonViews().getAppBar(title: "Products"),
        body: Obx(() {
          if (controller.isWaiting) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        height: 160,
                        width: 100.w,
                        color: Colors.grey,
                      )),
                );
              },
              itemCount: 10,
            );
          }
    if (controller.isError) {
      return Center(child: Text(controller.statusModel.value.errorMsg.value),);
    }
    return ListView.builder(
            itemBuilder: (context, index) {
              return _getItem(controller.products[index]);
            },
            itemCount: controller.products.length,
            shrinkWrap: true,
          );
        }));
  }

//   void _getProducts() async {
//     // encode / decode
//     // request body   encode
//     // response body  decode
// // url https://fakestoreapi.com/products
//     var url = Uri.parse('https://fakestoreapi.com/products');
//     var response = await http.get(
//       url,
//     );
//     if ((response.statusCode >= 200 && response.statusCode < 300) &&
//         response.body.isNotEmpty) {
//       // success
//       // string -> map / list   decode
//       // map -> object
//       List result = json.decode(response.body);
//
//       for (int index = 0; index < result.length; index++) {
//         products.add(ProductModel.fromMap(result[index]));
//       }
//       setState(() {});
//     }
//   }

  Widget _getItem(ProductModel model) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Image.network(
            model.image ?? '',
            height: 120,
            width: 100.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.title ?? '',
                style: TextStyle(
                    fontSize: 9.sp,
                    wordSpacing: 0.4,
                    overflow: TextOverflow.ellipsis),
              ),
              Expanded(
                  child: Text(
                model.price.toString(),
                textAlign: TextAlign.end,
              )),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  model.description ?? '',
                  style: TextStyle(fontSize: 8.sp, wordSpacing: 0.3),
                  maxLines: 2,
                ),
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.category ?? '',
                style: TextStyle(fontSize: 12.sp, wordSpacing: 0.3),
                maxLines: 1,
              ),
              Text(
                model.rating!.rate.toString(),
                style: TextStyle(fontSize: 12.sp, wordSpacing: 0.3),
                maxLines: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
