import 'package:dio/dio.dart';
import 'package:insights_news/core/api/news_model/news_model.dart';

class ApiServices {
  Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=9ef68db7b8c14cf28b7263ebfb608e58');
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      }
      // var url = Uri.parse(
      //     'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=125aac10045c4091a1fa77bc672ce782');
      // var res = await http.get(url);
      // if (res.statusCode == 200) {
      //   return NewsModel.fromJson(json.decode(res.body));
      // }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&source=$source&apiKey=9ef68db7b8c14cf28b7263ebfb608e58');
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> getNewsBySearch(String query) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&q=$query&apiKey=9ef68db7b8c14cf28b7263ebfb608e58');
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> getNewsForSlider(String category) async {
    try {
      var res = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=9ef68db7b8c14cf28b7263ebfb608e58');
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      }
      // var url = Uri.parse(
      //     'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=125aac10045c4091a1fa77bc672ce782');
      // var res = await http.get(url);
      // if (res.statusCode == 200) {
      //   return NewsModel.fromJson(json.decode(res.body));
      // }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
