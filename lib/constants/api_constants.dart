class ApiConstants {
  static const String baseDlUrl = 'https://techblog.sasansafari.com';
  static const String baseUrl =
      'https://techblog.sasansafari.com/Techblog/api/';
  static const String getHomeItems = '${baseUrl}home/?command=index';
  static const String getArticlesList =
      '${baseUrl}article/get.php?command=new&user_id=';

// TODO: need change I guess
  static const String getArticleInfo =
      '${baseUrl}article/get.php?command=info&id=';

  static const String postRegisterEmail = '${baseUrl}register/action.php';

  static const String getMyArticles =
      '${baseUrl}article/get.php?command=published_by_me&user_id=';

  static const String postArticle = '${baseUrl}article/post.php';

  // Podcasts API
  static const String getPodcastsList =
      '${baseUrl}podcast/get.php?command=new&user_id=';
  static const String getPodcastFiles =
      '${baseUrl}podcast/get.php?command=get_files&podcats_id=';
}

class ApiPostArticleKeys {
  static const String title = 'title';
  static const String content = 'content';
  static const String catId = 'cat_id';
  static const String tagList = 'tag_list';
  static const String userId = 'user_id';
  static const String image = 'image';
  static const String command = 'command';
}
