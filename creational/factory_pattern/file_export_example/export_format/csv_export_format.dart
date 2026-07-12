import '../entities/file.dart';
import 'export_format.dart';

class CSVExportFormat extends ExportFormat {
  CSVExportFormat(super.reportInfo);
  @override
  File generateFile() {
    String fileName = reportInfo.title + '.csv';
    print('CSV File generated');
    return File(fileName, Format.Csv);
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
