import 'package:e_shop_salait/constant.dart'; // Assuming you have this package set up.
import 'package:e_shop_salait/models/product.model.dart'; // Assuming you have this model set up.
import 'package:e_shop_salait/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxBool isDarkMode = false.obs;
  var cartItemCount = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "E-Shop",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                      ),
                      Text("Trending product"),
                    ],
                  ),
                  const Spacer(),
                  Obx(
                      () =>
                          Switch(
                          value: isDarkMode.value,
                          onChanged: (value){
                            isDarkMode.value = !isDarkMode.value;
                            Get.changeTheme(
                                Get.isDarkMode
                                    ? ThemeData.light()
                                    : ThemeData.dark()
                            );
                      })
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: lstProducts.length,
                  itemBuilder: (context, index) {
                    final product = lstProducts[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: product,
                            )
                        ));
                      },
                      child: SizedBox(
                        height: 200,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: lightTheme.surface,
                              ),
                              child: Hero(
                                tag: product.id,
                                child: Image.asset(
                                  product.image,
                                  width: 150,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              height: 150,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.description),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${product.price}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: lightTheme.error),
                                      ),
                                      const Spacer(),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        color: lightTheme.primary,
                                        onPressed: () {
                                          setState(() {
                                            cartItemCount.add(product);
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add_shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          // Handle cart navigation or action here
        },
        child: badges.Badge(
          badgeContent: Text(
            cartItemCount.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
