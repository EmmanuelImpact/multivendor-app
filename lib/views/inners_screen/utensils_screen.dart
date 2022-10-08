import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';

class UtensilsScreen extends StatefulWidget {
  const UtensilsScreen({Key? key}) : super(key: key);

  @override
  State<UtensilsScreen> createState() => _UtensilsScreenState();
}

class _UtensilsScreenState extends State<UtensilsScreen> {
  int indexChanged = 0;
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
              setState(() {
                indexChanged += indexChanged + 1;
              });
              return Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/utensils/uten$indexChanged.jpg',
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
