

class NewsModel {
    final int userId;
    final int id;
    final String title;
    final String body;

    NewsModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
