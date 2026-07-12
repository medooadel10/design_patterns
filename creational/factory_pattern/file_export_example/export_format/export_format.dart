import '../entities/file.dart';
import '../entities/report_info.dart';

abstract class ExportFormat {
  final ReportInfo reportInfo;

  ExportFormat(this.reportInfo);
  bool validate();
  File generateFile();
}
