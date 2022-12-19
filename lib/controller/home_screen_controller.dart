import 'package:blog_tech/component/api_constant.dart';
import 'package:blog_tech/models/article_model.dart';
import 'package:blog_tech/models/poster_model.dart';
import 'package:blog_tech/models/tags_model.dart';
import 'package:blog_tech/services/dio_service.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster = PosterModel().obs;
  late RxList<TagsModel> tagsList = RxList();
  late RxList<ArticleModel> topVisitedList = RxList();
  late RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItem);
    if (response.statusCode == 200) {
      // Success
      response.data['top_visited'].forEach(
        (element) {
          topVisitedList.add(ArticleModel.fromJson(element));
        },
      );
      response.data['tags'].forEach(
        (element) {
          tagsList.add(TagsModel.fromJson(element));
        },
      );
      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
