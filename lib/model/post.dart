class Post {
  String? title;
  String? summary;
  String? published;
  bool isLiked;
  int? id;
  String? link;
  Post({required this.title,required this.summary,required this.published,required this.isLiked,required this.id,required this.link });

  factory Post.fromJson(Map<String, dynamic> json) {
    // print("json:$json");
    return Post(
      title: json['title'],
      id: json['id'],
      summary: json["summary"],
      published: json["published"],
      link : json["link"],
      isLiked: false,
    );
  }
}