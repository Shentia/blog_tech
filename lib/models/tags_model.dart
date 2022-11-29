class TagsModel {
  late String id;
  late String title;

  TagsModel({required this.id, required this.title});

  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }
}
