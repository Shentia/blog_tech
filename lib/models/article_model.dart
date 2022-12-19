import 'package:blog_tech/component/api_constant.dart';

class ArticleModel {
  late String id;
  late String title;
  late String image;
  late String catId;
  late String catName;
  late String author;
  late String view;
  late String status;
  // late String? isFavorite;
  late String createdAt;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      // this.isFavorite,
      required this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = ApiConstant.hostDlUrl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    // isFavorite = element['is_favorite'];
    createdAt = element['created_at'];
  }
}
