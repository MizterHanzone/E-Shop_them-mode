import 'package:e_shop_salait/constant.dart';
import 'package:e_shop_salait/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ProductDetailsScreen extends StatefulWidget {

  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  final pageController = PageController();
  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const badges.Badge(
                        badgeContent: Text("2"),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.white
                        ),
                        child: Icon(Icons.shopping_cart),
                      ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: PageView(
                  onPageChanged: (index){
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  controller: pageController,
                  children: widget.product.productDetail!.images.map((e) =>
                      Hero(
                        tag: widget.product.id,
                          child: Image.asset(e))).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    widget.product.productDetail!.images.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: activeIndex == index ? Colors.blue : Colors.grey
                          ),
                )),
              ),
              Column(
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.product.description,
                    style: const TextStyle(
                        fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.product.productDetail!.colors.length, (index){
                  var color = widget.product.productDetail!.colors[index];
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        activeIndex = index;
                        pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 200),
                            curve:Curves.easeIn,
                        );
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: activeIndex == index ? Colors.deepPurple : Colors.white,
                          width: 5
                        )
                      ),
                      margin: const EdgeInsets.all(20),
                      height: 70,
                      width: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: color,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product.price}"
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                        onPressed: () {},
                        child: const Text(
                          "Add To Cart",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
