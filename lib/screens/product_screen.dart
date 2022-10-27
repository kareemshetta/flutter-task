import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/cubits/product_cubit.dart';
import 'package:flutter_task/cubits/product_states.dart';

import '../widget/price_product.dart';
import '../widget/splitted_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String productName = 'Apple AirPods Pro 2';

    return BlocProvider<ProductCubit>(
      lazy: false,
      create: (context) {
        return ProductCubit()..getProductsFromAll('airpods');
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'PriceRunner',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff54328E)),
          ),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {},
            builder: (context, state) {
              final productList = ProductCubit.get(context).products;
              if (state is GetAllProductSuccessState &&
                  productList.isNotEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          height: 300,
                          child: Image.network(productList[1].imageUrl,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color(0xff54328E)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: productName
                                  .split(' ')
                                  .map(
                                    (part) => TitleSplittedWidget(title: part),
                                  )
                                  .toList(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Discover & Compare Prices',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: productList.length,
                                itemBuilder: (context, index) {
                                  return PriceItem(
                                    imageUrl: productList[index].siteImage,
                                    price: productList[index].price.toString(),
                                    siteName: productList[index].siteName,
                                  );
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
