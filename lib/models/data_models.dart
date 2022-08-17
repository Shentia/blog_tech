class Hashtag {
  String title;

  Hashtag({required this.title});
}

class BlogModel {
  int id;
  String title;
  String imageURL;
  String author;
  String authorImageURL;
  String date;
  String content;
  String views;

  BlogModel({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.author,
    required this.authorImageURL,
    required this.date,
    required this.content,
    required this.views,
  });
}

class Podcast {
  int id;
  String title;
  String imageURL;

  Podcast({required this.id, required this.title, required this.imageURL});
}
