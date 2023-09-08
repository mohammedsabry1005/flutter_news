// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helpe/category_data.dart';
import 'package:flutter_news/helpe/news.dart';
import 'package:flutter_news/models/article_model.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/view/articale_view.dart';
import 'package:flutter_news/view/category_screen.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  List<CategoryModel> category = [];
  List<ArticleModel> article = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategory();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter News"),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
                color: Colors.red,
              ),
            )
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: category.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTime(
                              categoryName: category[index].title,
                              imageUrl: category[index].imageUrl,
                            );
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ListView.builder(
                          itemCount: article.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ArticleTime(
                              title: article[index].title,
                              imageUrl: article[index].urlToImage,
                              description: article[index].description,
                              url: article[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTime extends StatelessWidget {
  const CategoryTime({super.key, this.categoryName, this.imageUrl});

  final String? categoryName, imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(
              category: categoryName!.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 80,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTime extends StatelessWidget {
  const ArticleTime(
      {super.key, this.title, this.description, this.imageUrl, this.url});

  final String? title, description, imageUrl, url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScrean(
              blogUrl: url!,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl!),
            ),
            Text(
              title!,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              description!,
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
