final class News {
  final String? image;
  final String? title;
  final bool? isRead;
  final String? posted;
  final String? body;

  const News({
    this.image,
    this.title,
    this.isRead = false,
    this.posted,
    this.body,
  });

  News copyWith({
    String? image,
    String? title,
    bool? isRead,
    String? posted,
    String? body,
  }) {
    return News(
      image: image ?? this.image,
      title: title ?? this.title,
      isRead: isRead ?? this.isRead,
      posted: posted ?? this.posted,
      body: body ?? this.body,
    );
  }
}
