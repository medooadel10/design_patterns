import '../course/assignment.dart';
import '../course/certificate.dart';
import '../course/course.dart';
import '../course/downloadable_resource.dart';
import '../course/instructor.dart';
import '../course/live_session.dart';
import '../course/quiz.dart';
import '../course/recorded_lesson.dart';
import 'course_builder.dart';

class SelfPacedCourseBuilder implements CourseBuilder {
  List<RecordedLesson> recordedLessons = [];
  List<LiveSession> liveSessions = [];
  List<DownloadableResource> downloadableResources = [];
  List<Quiz> quizzes = [];
  List<Certificate> certificates = [];
  String? title;
  String? description;
  double? coursePrice;
  double? discount;
  DifficultyLevel? difficultyLevel;
  int? courseDuration;
  Instructor? instructor;
  Certificate? certificate;
  @override
  CourseBuilder addAssignments(List<Assignment> assignmens) {
    return this;
  }

  @override
  CourseBuilder addDownloadableResources(
    List<DownloadableResource> downloadableResources,
  ) {
    this.downloadableResources = downloadableResources;
    return this;
  }

  @override
  CourseBuilder addLiveSessions(List<LiveSession> liveSessions) {
    this.liveSessions = liveSessions;
    return this;
  }

  @override
  CourseBuilder addQuizzes(List<Quiz> quizzes) {
    this.quizzes = quizzes;
    return this;
  }

  @override
  CourseBuilder addRecordedSessions(List<RecordedLesson> recordedLessons) {
    this.recordedLessons = recordedLessons;
    return this;
  }

  @override
  CourseBuilder assignInstructor(Instructor instructor) {
    this.instructor = instructor;
    return this;
  }

  @override
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
      quizzes: quizzes,
      certificate: certificate,
    );
    return course;
  }

  @override
  CourseBuilder configureCertificate(Certificate certificate) {
    this.certificate = certificate;
    return this;
  }

  @override
  CourseBuilder setBasicInfo(String title, {String? description}) {
    this.title = title;
    this.description = description;
    return this;
  }

  @override
  CourseBuilder setDurationAndLevel(int duration, DifficultyLevel difficulty) {
    this.courseDuration = duration;
    this.difficultyLevel = difficulty;
    return this;
  }

  @override
  CourseBuilder setPriceAndDiscount(double price, double discount) {
    this.coursePrice = price;
    this.discount = discount;
    return this;
  }

  @override
  CourseBuilder setStudentLimit(int limit) {
    return this;
  }

  @override
  void validate() {
    if (title == null || title!.isEmpty) {
      throw UnimplementedError('Course title is required');
    } else if (description == null || description!.isEmpty) {
      throw UnimplementedError('Course description is required');
    } else if (recordedLessons.length < 3) {
      throw UnimplementedError(
        'Course must have at least three recorded lessons',
      );
    } else if (courseDuration == null || courseDuration! < 1) {
      throw UnimplementedError('Course duration is invalid');
    } else if (coursePrice == null && coursePrice! < 1) {
      throw UnimplementedError('Course price is invalid');
    }
  }
}
