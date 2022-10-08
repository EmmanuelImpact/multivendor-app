import 'package:flutter/material.dart';
import '/views/inners_screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          /*   iconTheme: const IconThemeData(
            color: Colors.white,
          ), */
          title: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchScreen();
                }),
              );
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  const Text(
                    'What are you looking for?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Men',
              ),
              Tab(
                text: 'Women',
              ),
              Tab(
                text: 'Kids',
              ),
              Tab(
                text: 'Shoes',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'Men Category',
              ),
            ),
            Center(
              child: Text(
                'Women Category',
              ),
            ),
            Center(
              child: Text(
                'Kids Category',
              ),
            ),
            Center(
              child: Text('Shoes Category'),
            ),
          ],
        ),
      ),
    );
  }
}
