class LiveSession {
  final String title;
  final String url;

  LiveSession(this.title, this.url);
  @override
  String toString() {
    return 'Title is $title, url is $url';
  }
}
