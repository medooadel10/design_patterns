import '../course/assignment.dart';
import '../course/certificate.dart';
import '../course/course.dart';
import '../course/downloadable_resource.dart';
import '../course/instructor.dart';
import '../course/live_session.dart';
import '../course/quiz.dart';
import '../course/recorded_lesson.dart';

abstract class BaseCourseBuilder {
  List<RecordedLesson> recordedLessons = [];
  List<LiveSession> liveSessions = [];
  List<DownloadableResource> downloadableResources = [];
  List<Quiz> quizzes = [];
  String? title;
  String? description;
  double? coursePrice;
  double? discount;
  DifficultyLevel? difficultyLevel;
  int? courseDuration;
  Instructor? instructor;
  Certificate? certificate;
  List<Assignment> assignments = [];
  int? studentLimit;

  BaseCourseBuilder setBasicInfo(String title, {String? description}) {
    this.title = title;
    this.description = description;
    return this;
  }

  BaseCourseBuilder assignInstructor(Instructor instructor) {
    this.instructor = instructor;
    return this;
  }

  BaseCourseBuilder setDurationAndLevel(
    int duration,
    DifficultyLevel difficulty,
  ) {
    this.courseDuration = duration;
    this.difficultyLevel = difficulty;
    return this;
  }

  BaseCourseBuilder addRecordedSessions(List<RecordedLesson> recordedLessons) {
    this.recordedLessons = recordedLessons;
    return this;
  }

  BaseCourseBuilder addLiveSessions(List<LiveSession> liveSessions) {
    this.liveSessions = liveSessions;
    return this;
  }

  BaseCourseBuilder addQuizzes(List<Quiz> quizzes) {
    this.quizzes = quizzes;
    return this;
  }

  BaseCourseBuilder addAssignments(List<Assignment> assignmens) {
    this.assignments = assignmens;
    return this;
  }

  BaseCourseBuilder addDownloadableResources(
    List<DownloadableResource> downloadableResources,
  ) {
    this.downloadableResources = downloadableResources;
    return this;
  }

  BaseCourseBuilder configureCertificate(Certificate certificate) {
    this.certificate = certificate;
    return this;
  }

  BaseCourseBuilder setPriceAndDiscount(double price, double discount) {
    this.coursePrice = price;
    this.discount = discount;
    return this;
  }

  BaseCourseBuilder setStudentLimit(int limit) {
    this.studentLimit = limit;
    return this;
  }

  void validate() {
    if (title == null || title!.isEmpty) {
      throw UnimplementedError('Course title is required');
    } else if (instructor == null) {
      throw UnimplementedError('Course must have an instructor');
    } else if (recordedLessons.isEmpty && liveSessions.isEmpty) {
      throw UnimplementedError(
        'Course must have at least one recorded lesson or live session',
      );
    } else if (courseDuration == null || courseDuration! < 1) {
      throw UnimplementedError('Course duration is invalid');
    } else if (coursePrice == null || coursePrice! < 1) {
      throw UnimplementedError('Course price is invalid');
    }
  }

  Course build() {
    validate();
    final course = Course(
      title!,
      courseDuration!,
      difficultyLevel!,
      recordedLessons,
      coursePrice!,
      discount!,
      instructor!,
      description: description,
      liveSessions: liveSessions,
      maxNoOfStudent: studentLimit,
      assignments: assignments,
      certificate: certificate,
      quizzes: quizzes,
      downloadableResources: downloadableResources,
    );
    return course;
  }
}
