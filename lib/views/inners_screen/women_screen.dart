import 'package:flutter/material.dart';
import '/models/categories_list.dart';

class WomenScreen extends StatelessWidget {
  const WomenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                return Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/women/w$index.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(womenSubCategory[index]),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
