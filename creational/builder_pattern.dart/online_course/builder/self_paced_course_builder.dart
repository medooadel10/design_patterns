import 'base_course_builder.dart';

class SelfPacedCourseBuilder extends BaseCourseBuilder {
  @override
  void validate() {
    super.validate();
    if (recordedLessons.length < 3) {
      throw UnimplementedError(
        'Course must have at least three recorded lessons',
      );
    }
  }
}
