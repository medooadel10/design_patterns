import 'base_course_builder.dart';

class LiveBootCampCourseBuilder extends BaseCourseBuilder {
  @override
  void validate() {
    super.validate();
    if (liveSessions.length < 1) {
      throw UnimplementedError('Course must have at least one live session');
    } else if (studentLimit == null) {
      throw UnimplementedError(
        'The maximum number of students must be defined',
      );
    } else if (studentLimit! > 30) {
      throw UnimplementedError('The maximum student count cannot exceed 30');
    }
  }
}
