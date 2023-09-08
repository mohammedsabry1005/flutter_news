// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helpe/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/view/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, this.category});

  final String? category;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<ArticleModel> article = [];
  bool _looding = true;

  @override
  void initState() {
    super.initState();

    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category!);
    article = newsClass.news;
    setState(() {
      _looding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Flutter News",
          style: TextStyle(color: Colors.amber),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: _looding
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: article.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ArticleTime(
                      title: article[index].title,
                      imageUrl: article[index].urlToImage,
                      description: article[index].description,
                    );
                  }),
            ),
    );
  }
}
