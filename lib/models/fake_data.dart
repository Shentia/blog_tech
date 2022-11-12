import 'package:blog_tech/gen/assets.gen.dart';
import 'data_models.dart';

// ignore: non_constant_identifier_names
Map FakeDataMap = {
  "imgUrl": Assets.images.news.path, //package Generator
  "author": "Ahmadreza",
  "date": "one day ago",
  "viewCount": "View 256",
  "description": "12+1 steps to coding flutter with ...",
};

//Blog Fake Data
List<Hashtag> hashtag = [
  Hashtag(title: "Flutter"),
  Hashtag(title: "Dart"),
  Hashtag(title: "Coding"),
  Hashtag(title: "Programming"),
  Hashtag(title: "Android"),
  Hashtag(title: "iOS"),
  Hashtag(title: "Web"),
  Hashtag(title: "Design"),
  Hashtag(title: "UI"),
  Hashtag(title: "UX"),
];

List<Hashtag> myCategories = [];
//Blog Fale Data News

List<BlogModel> blogList = [
  BlogModel(
    id: 1,
    title: "iOS 16: Everything New With Notes and Reminders",
    imageURL:
        "https://images.macrumors.com/t/dpJM-BQsBSDgjR-hsYgiKzwnqvA=/1600x0/article-new/2022/08/ios-16-notes.jpg",
    author: "macrumors",
    authorImageURL:
        "https://images.macrumors.com/images-new/macrumors-simple-logo-dark.svg",
    date: "DateTime.now().toString()",
    content:
        """Rather than selecting a specific passcode for a locked note, you can instead lock your notes with your ‌iPhone‌'s passcode. That makes more sense than thinking up a standalone password, because you're not likely to forget your ‌iPhone‌ passcode.""",
    views: "1201",
  ),
  BlogModel(
    id: 2,
    title: "iOS 16: Everything New With Notes and Reminders",
    imageURL:
        "https://images.macrumors.com/t/Y4nATDmJGNb-9HstdxwiSYAuYuQ=/1600x0/article-new/2022/06/iPhone-14-Dummies-1-Feature.jpg",
    author: "macrumors",
    authorImageURL:
        "https://images.macrumors.com/images-new/macrumors-simple-logo-dark.svg",
    date: "DateTime.now().toString()",
    content:
        """Rather than selecting a specific passcode for a locked note, you can instead lock your notes with your ‌iPhone‌'s passcode. That makes more sense than thinking up a standalone password, because you're not likely to forget your ‌iPhone‌ passcode.""",
    views: "121",
  ),
  BlogModel(
    id: 3,
    title: "iOS 16: Everything New With Notes and Reminders",
    imageURL:
        "https://images.macrumors.com/t/gOnrnhzluXYSnGMJfh5XjhH-eBM=/1600x0/article-new/2022/01/Apple-Watch-Series-7-Rainbow-Cropped-Blue-Discount.jpg",
    author: "macrumors",
    authorImageURL:
        "https://images.macrumors.com/images-new/macrumors-simple-logo-dark.svg",
    date: "DateTime.now().toString()",
    content:
        """Rather than selecting a specific passcode for a locked note, you can instead lock your notes with your ‌iPhone‌'s passcode. That makes more sense than thinking up a standalone password, because you're not likely to forget your ‌iPhone‌ passcode.""",
    views: "191",
  ),
  BlogModel(
    id: 4,
    title: "iOS 16: Everything New With Notes and Reminders",
    imageURL:
        "https://images.macrumors.com/t/ggbV9rSaEmo7QMGHa6oha3aDLxM=/1600x0/article-new/2021/02/facebook-tracking-notification.jpg",
    author: "macrumors",
    authorImageURL:
        "https://images.macrumors.com/images-new/macrumors-simple-logo-dark.svg",
    date: "DateTime.now().toString()",
    content:
        """Rather than selecting a specific passcode for a locked note, you can instead lock your notes with your ‌iPhone‌'s passcode. That makes more sense than thinking up a standalone password, because you're not likely to forget your ‌iPhone‌ passcode.""",
    views: "932",
  ),
];

//Podcast Fake Data
List<Podcast> podcastList = [
  Podcast(
    id: 1,
    title: "Podcast Apple",
    imageURL:
        "https://images.macrumors.com/t/Y4nATDmJGNb-9HstdxwiSYAuYuQ=/1600x0/article-new/2022/06/iPhone-14-Dummies-1-Feature.jpg",
  ),
  Podcast(
    id: 2,
    title: "Podcast Google",
    imageURL:
        "https://images.macrumors.com/t/gOnrnhzluXYSnGMJfh5XjhH-eBM=/1600x0/article-new/2022/01/Apple-Watch-Series-7-Rainbow-Cropped-Blue-Discount.jpg",
  ),
  Podcast(
    id: 3,
    title: "Podcast Flutter",
    imageURL:
        "https://images.macrumors.com/t/ggbV9rSaEmo7QMGHa6oha3aDLxM=/1600x0/article-new/2021/02/facebook-tracking-notification.jpg",
  ),
];
