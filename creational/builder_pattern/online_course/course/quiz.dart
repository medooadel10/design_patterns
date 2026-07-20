class Quiz {
  final String title;
  final double baseResult;

  Quiz(this.title, this.baseResult);
  @override
  String toString() {
    return 'Title is $title, base result is $baseResult';
  }
}
