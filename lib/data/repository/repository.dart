import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sehatku/data/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:sehatku/data/model/user_model.dart';

class Repository {
  Future<List<Product>> getProducts() async {
    final response =
        await rootBundle.loadString('lib/assets/json/product.json');

    final data = await json.decode(response);
    final List<Product> products = [];
    for (var i = 0; i < data.length; i++) {
      products.add(Product.fromJson(data[i]));
    }
    return products;
  }

  Future<User> postLogin(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
