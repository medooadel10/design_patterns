import 'builder/live_bootcamp_course_builder.dart';
import 'builder/self_paced_course_builder.dart';
import 'course/course.dart';
import 'course_director.dart';

void main() {
  final builder = SelfPacedCourseBuilder();
  final director = CourseDirector(builder);
  Course course = director.buildSelfPacedCourse();
  print(course.toString());
  final liveBuilder = LiveBootCampCourseBuilder();
  director.changeBuilder(liveBuilder);
  course = director.buildLiveBootCampCourse();
  print(liveBuilder.studentLimit);
  print(course.toString());
}
