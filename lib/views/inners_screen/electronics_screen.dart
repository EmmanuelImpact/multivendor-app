import 'package:flutter/material.dart';
import '/models/categories_list.dart';
import '/views/inners_screen/product_item_detail_page.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Electronics',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 70,
            crossAxisSpacing: 15,
            children: [
              ...List.generate(electSubCategory.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (
                        BuildContext context,
                      ) {
                        return ProductItemDetailScreen(
                          mainCategory: 'Electronics',
                          subCategory: electSubCategory[index],
                        );
                      }),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/electronics/elect$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(electSubCategory[index]),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
