import 'package:flutter/material.dart';

class ProductItemDetailScreen extends StatelessWidget {
  final String mainCategory;
  final String subCategory;

  ProductItemDetailScreen({
    required this.mainCategory,
    required this.subCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mainCategory,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Text(
          subCategory,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
