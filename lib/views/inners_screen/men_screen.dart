import 'package:flutter/material.dart';
import 'package:multi_vendor_app/models/categories_list.dart';

class MenScreen extends StatelessWidget {
  const MenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Men',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 70,
            crossAxisSpacing: 15,
            children: List.generate(menSubCategory.length, (index) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.asset(
                        'assets/images/men/men$index.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    menSubCategory[index],
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
