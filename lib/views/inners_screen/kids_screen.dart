import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';

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
              return Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/kids/kids$index',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(kidsSubCategory[index]),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
