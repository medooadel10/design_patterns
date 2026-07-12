import '../entities/file.dart';
import 'export_format.dart';

class ExcelExportFormat extends ExportFormat {
  ExcelExportFormat(super.reportInfo);
  @override
  File generateFile() {
    String fileName = reportInfo.title + '.xlsx';
    print('Excel File generated');
    return File(fileName, Format.Excel);
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
