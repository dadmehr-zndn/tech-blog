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
}
