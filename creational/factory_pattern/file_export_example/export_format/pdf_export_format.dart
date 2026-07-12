import '../entities/file.dart';
import 'export_format.dart';

class PdfExportFormat extends ExportFormat {
  PdfExportFormat(super.reportInfo);
  @override
  File generateFile() {
    String fileName = reportInfo.title + '.pdf';
    print('Pdf File generated');
    return File(fileName, Format.Pdf);
  }

  @override
  bool validate() {
    if (reportInfo.creationDate.isEmpty) {
      print('The report should be include the creation date');
      return false;
    }
    return true;
  }
}
