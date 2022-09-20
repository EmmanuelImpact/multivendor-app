import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const CupertinoSearchTextField(),
      ),
      body: const Center(
        child: CupertinoActivityIndicator(
          radius: 20,
        ),
      ),
    );
  }
}
