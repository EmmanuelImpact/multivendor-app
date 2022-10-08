import 'package:flutter/material.dart';
import '/models/categories_list.dart';
import '/views/inners_screen/product_item_detail_page.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Groceries',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 70,
            crossAxisSpacing: 15,
            children: List.generate(groceriesSubCategory.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return ProductItemDetailScreen(
                          mainCategory: 'Groceries',
                          subCategory: groceriesSubCategory[index],
                        );
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/groceries/groce$index.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(groceriesSubCategory[index]),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
