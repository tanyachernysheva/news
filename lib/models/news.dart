final class News {
  final String? image;
  final String? title;
  final bool? isRead;
  final String? posted;

  const News({
    this.image,
    this.title,
    this.isRead = false,
    this.posted,
  });
}
