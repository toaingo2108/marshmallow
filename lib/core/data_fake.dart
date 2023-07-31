// temple
import 'package:marshmallow/core/models/product.dart';

List<Map<String, String>> data1 = [
  {"image": "assets/images/ic_mws_kitchen.png", "title": "Mw’s Kitchen"},
  {"image": "assets/images/ic_snacks.png", "title": "Snacks"},
  {"image": "assets/images/ic_candy.png", "title": "Candy"},
  {"image": "assets/images/ic_drinks.png", "title": "Drinks"},
  {"image": "assets/images/ic_pets.png", "title": "Pets"},
  {"image": "assets/images/ic_deals.png", "title": "Deals"},
  {"image": "assets/images/ic_alcohol.png", "title": "Alcohol"},
  {"image": "assets/images/ic_healthy.png", "title": "Healthy"},
  {"image": "assets/images/ic_frozen.png", "title": "Frozen"},
  {"image": "assets/images/ic_health.png", "title": "Health"},
];
List<Product> data2 = List.generate(
  10,
  (index) => Product(
    productID: index.toString(),
    images: ["image_url_$index"],
    name: "Product Name $index",
    price: 2.99,
    salePrice: index % 3 == 0 ? 1.99 : null,
    stock: {},
    dietary: "Kosher",
    category: Categories.none,
    brand: Brands.none,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ingredients: "egg, milk, soy and wheat",
    unit: index.isEven ? "2L" : "5.25oz",
  ),
);

List<Product> data3 = List.generate(
  10,
  (index) => Product(
    productID: (index + 11).toString(),
    images: ["image_url_${index + 11}"],
    name: "Product Name ${index + 11}",
    price: 2.99,
    stock: {},
    dietary: "Kosher",
    category: Categories.none,
    brand: Brands.none,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ingredients: "egg, milk, soy and wheat",
    unit: index.isEven ? "2L" : "5.25oz",
  ),
);

Map<String, dynamic> data4 = {
  "title": "For you",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
    {"image": "assets/images/ic_snacks.png", "title": "Drinks"},
    {"image": "assets/images/ic_candy.png", "title": "Frozen"},
  ]
};

Map<String, dynamic> data5 = {
  "title": "Alcohol",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
    {"image": "assets/images/ic_snacks.png", "title": "Drinks"},
    {"image": "assets/images/ic_candy.png", "title": "Frozen"},
    {"image": "assets/images/ic_drinks.png", "title": "Health"},
    {"image": "assets/images/ic_pets.png", "title": "Candy"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
  ]
};

Map<String, dynamic> data6 = {
  "title": "Food & Drink",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
    {"image": "assets/images/ic_snacks.png", "title": "Drinks"},
    {"image": "assets/images/ic_candy.png", "title": "Frozen"},
    {"image": "assets/images/ic_drinks.png", "title": "Health"},
    {"image": "assets/images/ic_pets.png", "title": "Candy"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
  ]
};

Map<String, dynamic> data7 = {
  "title": "Health",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
    {"image": "assets/images/ic_snacks.png", "title": "Drinks"},
    {"image": "assets/images/ic_candy.png", "title": "Frozen"},
    {"image": "assets/images/ic_drinks.png", "title": "Health"},
    {"image": "assets/images/ic_pets.png", "title": "Candy"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
  ]
};

Map<String, dynamic> data8 = {
  "title": "Home",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
    {"image": "assets/images/ic_snacks.png", "title": "Drinks"},
    {"image": "assets/images/ic_candy.png", "title": "Frozen"},
    {"image": "assets/images/ic_drinks.png", "title": "Health"},
    {"image": "assets/images/ic_pets.png", "title": "Candy"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
    {"image": "assets/images/ic_deals.png", "title": "Healthy"},
    {"image": "assets/images/ic_alcohol.png", "title": "Pets"},
  ]
};

Map<String, dynamic> data9 = {
  "title": "Miscellaneous",
  "data": [
    {"image": "assets/images/ic_mws_kitchen.png", "title": "Snacks"},
  ]
};

List<Map<String, dynamic>> data10 = [data5, data6, data7, data9];

List<Map<String, dynamic>> data11 = [
  {
    "url_image": "assets/images/img_lightning.png",
    "title": "Faster",
    "time": "00-00",
    "price": "2.99",
    "isEnable": false,
  },
  {
    "url_image": "assets/images/img_lightning.png",
    "title": "Fast",
    "time": "00-00",
    "price": "",
    "isEnable": false,
  },
  {
    "url_image": "assets/images/img_clock.png",
    "title": "Schedule",
    "time": "Pick a time",
    "price": "",
    "isEnable": false,
  },
];

List<Map<String, dynamic>> data12 = [
  {
    "price": "2.49",
    "isEnable": false,
  },
  {
    "price": "3.99",
    "isEnable": false,
  },
  {
    "price": "4.99",
    "isEnable": false,
  },
  {
    "price": "Custom",
    "isEnable": false,
  },
];
