import 'package:flutter/material.dart';
import '/views/inners_screen/men_screen.dart';
import '/models/categories_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      _pageController.jumpToPage(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 85,
                      decoration: BoxDecoration(
                        color: mainCategoryList[index].isSelected == true
                            ? Colors.white
                            : Colors.grey.shade300,
                      ),
                      child: Text(
                        mainCategoryList[index].title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
                itemCount: mainCategoryList.length,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (value) {
                  for (var elements in mainCategoryList) {
                    elements.isSelected = false;
                  }
                  setState(() {
                    mainCategoryList[value].isSelected = true;
                  });
                },
                children: [
                  MenScreen(),
                  Center(
                    child: Text('Women'),
                  ),
                  Center(
                    child: Text('Electronics'),
                  ),
                  Center(
                    child: Text('Kids'),
                  ),
                  Center(
                    child: Text('Groceries'),
                  ),
                  Center(
                    child: Text('Utensils'),
                  ),
                  Center(
                    child: Text('Upholstery'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
