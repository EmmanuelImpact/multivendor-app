import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';
import 'package:multi_vendor_app/views/inners_screen/product_item_detail_page.dart';

class UtensilsScreen extends StatefulWidget {
  const UtensilsScreen({Key? key}) : super(key: key);

  @override
  State<UtensilsScreen> createState() => _UtensilsScreenState();
}

class _UtensilsScreenState extends State<UtensilsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Utensils',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120,
              childAspectRatio: 1.8 / 2,
              mainAxisSpacing: 70,
              crossAxisSpacing: 15,
            ),
            children: List.generate(
              utensilsSubCategory.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return ProductItemDetailScreen(
                            mainCategory: 'Utensils',
                            subCategory: utensilsSubCategory[index],
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
                            'assets/images/utensils/uten$index.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        utensilsSubCategory[index],
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
