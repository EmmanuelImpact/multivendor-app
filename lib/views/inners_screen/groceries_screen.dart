import 'package:flutter/material.dart';
import '/models/categories_list.dart';
import '/views/inners_screen/product_item_detail_page.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Groceries',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
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
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        child: Image.asset(
                          'assets/images/groceries/groce$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      groceriesSubCategory[index],
                      style: Theme.of(context).textTheme.headline6,
                    ),
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
