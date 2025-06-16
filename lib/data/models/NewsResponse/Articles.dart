
import 'package:news/data/models/sourceReponse/Sources.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Jess Weatherbed"
/// title : "NYT reports Elon Musk’s drug use went ‘well beyond occasional’ in 2024"
/// description : "Elon Musk may have understated the “small amount” of ketamine that he said he was using in a Don Lemon interview last year, according to sources for The New York Times. The publication reports that around the time Musk endorsed Donald Trump’s Presidential run…"
/// url : "https://www.theverge.com/news/677130/elon-musk-ketamine-nyt-report"
/// urlToImage : "https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/24083661/STK171_L_Allen_Musk_01.jpg?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200"
/// publishedAt : "2025-05-30T16:57:31Z"
/// content : "Which might explain a few things.\r\nWhich might explain a few things.\r\nElon Musk may have understated the small amount of ketamine that he said he was using in a Don Lemon interview last year, accordi… [+1745 chars]"

class NewsArticles {
  NewsArticles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  NewsArticles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}