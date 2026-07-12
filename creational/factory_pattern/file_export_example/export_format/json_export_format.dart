import '../entities/file.dart';
import 'export_format.dart';

class JsonExportFormat extends ExportFormat {
  JsonExportFormat(super.reportInfo);

  @override
  File generateFile() {
    String fileName = reportInfo.title + '.json';
    print('JSON File generated');
    return File(fileName, Format.Json);
  }

  @override
  bool validate() {
    if (reportInfo.rows.isEmpty) {
      print('The report should have at least one row');
      return false;
    }
    return true;
  }
}
