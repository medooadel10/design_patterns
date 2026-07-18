import 'assignment.dart';
import 'certificate.dart';
import 'instructor.dart';
import 'live_session.dart';
import 'quiz.dart';
import 'recorded_lesson.dart';

class Course {
  final String title;
  final String? description;
  final int courseDuration;
  final DifficultyLevel diffcultyLevel;
  final List<RecordedLesson> recordedLessons;
  final List<LiveSession>? liveSessions;
  final Instructor instructor;
  final List<Quiz>? quizzes;
  final List<Assignment>? assignments;
  final Certificate? certificate;
  final double coursePrice;
  final double discount;
  final int? maxNoOfStudent;

  Course(
    this.title,
    this.courseDuration,
    this.diffcultyLevel,
    this.recordedLessons,
    this.coursePrice,
    this.discount,
    this.instructor, {
    this.description,
    this.assignments,
    this.liveSessions,
    this.maxNoOfStudent,
    this.quizzes,
    this.certificate,
  });

  @override
  String toString() {
    return 'Title is $title, description is $description, course duration is $courseDuration, difficulty level is $diffcultyLevel, recorded lessons are $recordedLessons, live sessions are $liveSessions, instructor is $instructor, quizzes are $quizzes, assignments are $assignments, certificate is $certificate, course price is $coursePrice, discount is $discount, max no of student is $maxNoOfStudent';
  }
}

enum DifficultyLevel { easy, medium, hard }
