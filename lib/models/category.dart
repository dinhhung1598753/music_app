class Category {
  final String encodeId;
  final String cover;
  final String thumbnail;
  final String title;
  const Category(
      {required String this.encodeId,
      required String this.cover,
      required String this.thumbnail,
      required String this.title});

  Category.fromJson(Map<String, dynamic> json)
      : encodeId = json['encodeId'],
        cover = json['cover'],
        thumbnail = json['thumbnail'],
        title = json['title'];
}
