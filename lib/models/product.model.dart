import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String image;
  final double price;
  final ProductDetail? productDetail;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.productDetail,
  });
}

class ProductDetail {
  final List<String> images;
  final String name;
  final String description;
  final double price;
  final List<Color> colors;

  ProductDetail({
    required this.images,
    required this.name,
    required this.description,
    required this.price,
    required this.colors,
  });
}

var lstProducts = [
  Product(
    id: '1',
    name: 'Iphone 15 Pro Max',
    description: "Apple's latest iPhone 15 Pro Max with 5G",
    image: 'assets/images/iphone.png',
    price: 900,
    productDetail: ProductDetail(
      images: [
        'assets/images/iphonered.png',
        'assets/images/iphonegray.png',
        'assets/images/iphonepink.png',
      ],
      name: 'Iphone 15 Pro Max',
      description: "Apple's latest iPhone 15 Pro Max with 5G",
      price: 900,
      colors: [Colors.red, Colors.grey, Colors.pinkAccent.withOpacity(0.1)],
    ),
  ),
  Product(
    id: '2',
    name: "Asus ROG",
    description: "Asus's latest gaming laptop",
    image: 'assets/images/asus.png',
    price: 502,
    productDetail: ProductDetail(
      images: [
        'assets/images/asus.png',
        'assets/images/asusback.png',
        'assets/images/asusfront.png',
      ],
      name: "Asus ROG",
      description: "Asus's latest gaming laptop",
      price: 502,
      colors: [Colors.grey, Colors.white70, Colors.pink],
    ),
  ),
  Product(
    id: '3',
    name: 'Macbook Pro 2021',
    description: "Apple's latest Macbook Pro 2021",
    image: 'assets/images/macbook.png',
    price: 778,
    productDetail: ProductDetail(
      images: [
        'assets/images/macbook.png',
        'assets/images/macbookback.png',
        'assets/images/macbookfront.png',
      ],
      name: 'Macbook Pro 2021',
      description: "Apple's latest Macbook Pro 2021",
      price: 778,
      colors: [Colors.grey, Colors.white70, Colors.pink],
    ),
  ),
  Product(
    id: '4',
    name: 'Samsung Galaxy S21',
    description: "Samsung's latest Galaxy S21 with 5G",
    image: 'assets/images/samsung.png',
    price: 223,
    productDetail: ProductDetail(
      images: [
        'assets/images/samsung.png',
        'assets/images/samsungback.png',
        'assets/images/samsungfront.png',
      ],
      name: 'Samsung Galaxy S21',
      description: "Samsung's latest Galaxy S21 with 5G",
      price: 223,
      colors: [Colors.grey, Colors.white70, Colors.pink],
    ),
  ),
];
