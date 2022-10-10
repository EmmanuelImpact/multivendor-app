import 'package:flutter/material.dart';
import 'package:multi_vendor_app/views/inners_screen/product_item_detail_page.dart';
import '/models/categories_list.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Women',
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
            children: List.generate(
              womenSubCategory.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return ProductItemDetailScreen(
                            mainCategory: 'Women',
                            subCategory: womenSubCategory[index],
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/images/women/w$index.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        womenSubCategory[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
