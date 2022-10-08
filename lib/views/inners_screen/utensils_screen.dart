import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';

class UtensilsScreen extends StatelessWidget {
  const UtensilsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Utensils',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 70,
              crossAxisSpacing: 15,
            ),
            children: utensilsSubCategory.map((utensils) {
              int index = 0;
              return Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/utensils/uten$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(utensils),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
