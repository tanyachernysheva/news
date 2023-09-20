import 'package:news/models/news.dart';

abstract final interface class NewsRepo{
  Future<List<News>> getFeaturedNews();
  Future<List<News>> getLatestNews();
} 


final class FakeNewsRepo implements NewsRepo{
  @override
  Future<List<News>> getFeaturedNews() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const News(
        title: 'We are processing your request...',
        posted: '1 day ago',
        isRead: false,
        image: 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBjb2RlfGVufDB8fDB8fHww&w=1000&q=80',
        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n\n Proin ac purus quis metus rutrum pharetra. Nam in lorem nec ex feugiat vehicula eu eget lacus. Donec vitae ipsum in eros accumsan dignissim. Suspendisse ac luctus lacus. Proin eleifend erat augue, ac accumsan augue volutpat et. Donec porta quis purus ac faucibus. Nunc at varius enim.',
      ),
      const News(
        title: 'We are processing your title...',
        posted: '1 day ago',
        isRead: false,
        image: 'https://img.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg',
        body: 'hello2',
      ),
      const News(
        title: 'We are processing your request...',
        posted: '1 day ago',
        isRead: false,
        image: 'https://images.indianexpress.com/2023/07/Code-Interpreter-Plugin-2.jpg',
        body: 'Hello3',
      ),
    ];
  }
  
  @override
  Future<List<News>> getLatestNews() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const News(
        title: 'We are processing your request...',
        posted: '1 day ago',
        isRead: false,
        image: 'https://img.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg',
        body: 'Hello',
      ),
      const News(
        title: 'We are processing your title...',
        posted: '2 day ago',
        isRead: true,
        image: 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29tcHV0ZXIlMjBjb2RlfGVufDB8fDB8fHww&w=1000&q=80',
        body: 'Hello',
      ),
      const News(
        title: 'We are processing your request...',
        posted: '3 day ago',
        isRead: false,
        image: 'https://images.indianexpress.com/2023/07/Code-Interpreter-Plugin-2.jpg',
        body: 'Hello',
      ),
    ];
  }

} 