import 'package:blog_tech/models/article_info_model.dart';
import 'package:blog_tech/models/tags_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../component/api_constant.dart';
import '../models/article_model.dart';
import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;

  RxInt id = RxInt(0);
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> relatedArticleList = RxList();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;

  @override
  void onInit() {
    super.onInit();
    // getArticleInfo();
  }

  getArticleInfo() async {
    loading.value = true;
    var userId = '';
    // debugPrint(
    //     '${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }
    tagsList.clear();
    response.data['tags'].forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });
    relatedArticleList.clear();
    response.data['related'].forEach((element) {
      relatedArticleList.add(ArticleModel.fromJson(element));
    });
  }
}
