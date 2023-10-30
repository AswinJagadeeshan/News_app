import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:news_app/view/widgets/retry_card.dart';

import '../../controller/news_controller.dart';
import '../widgets/news_card.dart';
import '../widgets/searchbar.dart';

class MainPage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 243, 252),
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Top News")],
          ),
        ),
        body: Obx(() {
          // if data is loading.
          if (newsController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // if failed to fetch data
          if (newsController.isFailed.value) {
            return Retrycard(newsController);
          }

         return Column(
            children: [
              // searchbar here
              TextField(
                onChanged: (str) {
                  newsController.updateList();
                },
                // textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.bottom,
                controller: newsController.searchTextController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    prefixIcon: const Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    filled: true,
                    hintText: 'Search news',
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              Expanded(
                  child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: newsController.newsArticles.value.length,
                itemBuilder: (BuildContext, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(HomePage(
                          title: newsController.newsArticles[index].title,
                          description:
                              newsController.newsArticles[index].description,
                          publishedAt: newsController
                              .newsArticles[index].publishedAt
                              .toString(),
                          author: newsController.newsArticles[index].author!,
                          imageUrl:
                              newsController.newsArticles[index].urlToImage!,
                          content: newsController.newsArticles[index].content));
                    },
                    child: NewsCard(
                      title: newsController.newsArticles[index].title,
                      imageUrl:
                          newsController.newsArticles[index].urlToImage ?? "",
                    ),
                  );
                },
              )),
            ],
          );
        }));
  }
}

// top new heading
// search bar
// list / progressBar / errorCard



