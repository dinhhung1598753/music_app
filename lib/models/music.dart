class Music {
  final String id;
  final String name;
  final String singer;
  final String thumbnail;
  final String url;
  const Music(
      {required String this.id,
      required String this.name,
      required String this.singer,
      required String this.thumbnail,
      required String this.url});

  Music.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        singer = json['singer'],
        thumbnail = json['thumbnail'],
        url = json['url'];
}
