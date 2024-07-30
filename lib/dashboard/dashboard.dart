import 'dart:convert';

import 'package:ecommerce/common/services/remote_config.dart';
import 'package:ecommerce/common/widgets/common_helper_widget.dart';
import 'package:ecommerce/dashboard/providers/fetch_products_provider.dart';
import 'package:ecommerce/dashboard/providers/search_product_controller_provider.dart';
import 'package:ecommerce/dashboard/providers/search_product_input_provider.dart';
import 'package:ecommerce/dashboard/widgets/dashboard_helper.dart';
import 'package:ecommerce/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  bool status = true;

  @override
  void initState() {
    super.initState();
    getWhetherToDisplayDescountedPrice();
  }

  void getWhetherToDisplayDescountedPrice() async {
    var serverJsonData = (await FirebaseRemoteConfigClass().initializeConfig('displayDiscountPrice'));
    setState(() {
      status = json.decode(serverJsonData)['status'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchControllerProducts = ref.watch(searchProductControllerProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        toolbarHeight: 82.h,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildHeadingText(context, Colors.white),
            IconButton(
              onPressed: () async {
                final nav = Navigator.of(context);
                final auth = FirebaseAuth.instance;
                await auth.signOut();
                nav.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              icon: const Icon(Icons.logout_rounded),
              color: Colors.white,
            ),
          ],
        ),
        systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle!.copyWith(
              statusBarColor: Theme.of(context).colorScheme.secondary,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Theme.of(context).colorScheme.primary,
            ),
      ),
      body: ref.watch(fetchProductsProvider).when(
        data: (products) {
          return Container(
            margin: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w, bottom: 16.h),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                buildSearchField(context, (inputText) {
                  ref.read(searchProductInputProvider.notifier).state = inputText;
                  ref.read(searchProductControllerProvider.notifier).onSearchEvent(inputText, products);
                }),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.47,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 14,
                    ),
                    itemCount: searchControllerProducts.isNotEmpty ? searchControllerProducts.length : products.length,
                    itemBuilder: (context, index) {
                      final product = searchControllerProducts.isNotEmpty ? searchControllerProducts[index] : products[index];
                      return buildProductCard(
                        context,
                        product.title,
                        product.description,
                        product.price,
                        product.discountPercentage,
                        product.images[0],
                        status,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        },
      ),
    );
  }
}
