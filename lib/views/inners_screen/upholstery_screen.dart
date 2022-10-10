import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';
import 'package:multi_vendor_app/views/inners_screen/product_item_detail_page.dart';

class UpholsteriesScreen extends StatelessWidget {
  const UpholsteriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Upholstery',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 70,
              crossAxisSpacing: 15,
            ),
            itemCount: upholsterySubCategory.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return ProductItemDetailScreen(
                          mainCategory: 'Upholstery',
                          subCategory: upholsterySubCategory[index],
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
                          'assets/images/upholstery/upho$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      upholsterySubCategory[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
