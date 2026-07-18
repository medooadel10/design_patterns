import '../course/assignment.dart';
import '../course/certificate.dart';
import '../course/course.dart';
import '../course/downloadable_resource.dart';
import '../course/instructor.dart';
import '../course/live_session.dart';
import '../course/quiz.dart';
import '../course/recorded_lesson.dart';

abstract class CourseBuilder {
  CourseBuilder setBasicInfo(String title, {String? description});
  CourseBuilder assignInstructor(Instructor instructor);
  CourseBuilder setDurationAndLevel(int duration, DifficultyLevel difficulty);
  CourseBuilder addRecordedSessions(List<RecordedLesson> recordedLessons);
  CourseBuilder addLiveSessions(List<LiveSession> liveSessions);
  CourseBuilder addQuizzes(List<Quiz> quizzes);
  CourseBuilder addAssignments(List<Assignment> assignmens);
  CourseBuilder addDownloadableResources(
    List<DownloadableResource> downloadableResources,
  );
  CourseBuilder configureCertificate(Certificate certificate);
  CourseBuilder setPriceAndDiscount(double price, double discount);
  CourseBuilder setStudentLimit(int limit);
  void validate();
  Course build();
}
