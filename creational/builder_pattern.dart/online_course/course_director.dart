import 'builder/course_builder.dart';
import 'course/assignment.dart';
import 'course/certificate.dart';
import 'course/course.dart';
import 'course/downloadable_resource.dart';
import 'course/instructor.dart';
import 'course/live_session.dart';
import 'course/quiz.dart';
import 'course/recorded_lesson.dart';

class CourseDirector {
  CourseBuilder builder;

  CourseDirector(this.builder);

  Course buildSelfPacedCourse() {
    final instrcutor = Instructor('Mohamed Adel');
    final quizzes = [Quiz('Dart', 70), Quiz('OOP', 80)];
    final recordedSessions = [
      RecordedLesson('Intro to programming'),
      RecordedLesson('Dart Variables'),
      RecordedLesson('Dart Functions'),
    ];
    final downloadableResources = [DownloadableResource('dart.pdf')];
    final certificate = Certificate('Flutter Course');

    return builder
        .setBasicInfo('Flutter', description: 'Cross Platform Mobile Dev')
        .assignInstructor(instrcutor)
        .setDurationAndLevel(40, DifficultyLevel.easy)
        .addQuizzes(quizzes)
        .addRecordedSessions(recordedSessions)
        .addDownloadableResources(downloadableResources)
        .configureCertificate(certificate)
        .setPriceAndDiscount(10000, 10)
        .build();
  }

  Course buildLiveBootCampCourse() {
    final instrcutor = Instructor('Ahmed Ali');
    final assignments = [Assignment('Dart'), Assignment('OOP')];
    final recordedSessions = [
      RecordedLesson('Intro to programming'),
      RecordedLesson('Dart Variables'),
      RecordedLesson('Dart Functions'),
    ];
    final downloadableResources = [DownloadableResource('dart.pdf')];
    final certificate = Certificate('Flutter Course');
    final liveSessions = [LiveSession('Session 1', 'session1.com')];

    return builder
        .setBasicInfo('Flutter', description: 'Cross Platform Mobile Dev')
        .assignInstructor(instrcutor)
        .setDurationAndLevel(40, DifficultyLevel.medium)
        .addRecordedSessions(recordedSessions)
        .addDownloadableResources(downloadableResources)
        .configureCertificate(certificate)
        .setPriceAndDiscount(10000, 10)
        .addLiveSessions(liveSessions)
        .addAssignments(assignments)
        .setStudentLimit(30)
        .build();
  }

  void changeBuilder(CourseBuilder builder) {
    this.builder = builder;
  }
}
