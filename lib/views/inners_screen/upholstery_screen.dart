import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';

class UpholsteriesScreen extends StatelessWidget {
  const UpholsteriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Upholstery',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
            itemCount: utensilsSubCategory.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/upholstery/upho$index.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(upholsterySubCategory[index]),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
