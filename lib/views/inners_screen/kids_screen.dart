import 'package:flutter/material.dart';
import '/models/categories_list.dart';
import '/views/inners_screen/product_item_detail_page.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Kids',
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
            children: List.generate(kidsSubCategory.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return ProductItemDetailScreen(
                          mainCategory: 'Kids',
                          subCategory: kidsSubCategory[index],
                        );
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/kids/kids$index.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(kidsSubCategory[index]),
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
