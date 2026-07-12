import '../entities/file.dart';
import '../entities/report_info.dart';
import '../export_format/csv_export_format.dart';
import '../export_format/excel_export_format.dart';
import '../export_format/export_format.dart';
import '../export_format/json_export_format.dart';
import '../export_format/pdf_export_format.dart';

abstract class FileExportProcessor {
  final ReportInfo reportInfo;

  FileExportProcessor(this.reportInfo);
  ExportFormat createFormat();

  void saveAndGenerateFile() {
    final exportFormat = createFormat();
    if (_validate() && exportFormat.validate()) {
      final file = exportFormat.generateFile();
      // Save File
      print('File has been saved');
      file.status = Status.saved;
      print(
        'Report Title: ${reportInfo.title}\nExportFormat: ${file.format}\nExported Rows: ${reportInfo.rows.length}\nStatus: ${file.status}',
      );
    }
  }

  bool _validate() {
    if (reportInfo.title.isEmpty) {
      print('Report title is required');
      return false;
    }
    return true;
  }
}

class PDFExportProcessor extends FileExportProcessor {
  PDFExportProcessor(super.reportInfo);

  @override
  ExportFormat createFormat() {
    return PdfExportFormat(reportInfo);
  }
}

class ExcelExportProcessor extends FileExportProcessor {
  ExcelExportProcessor(super.reportInfo);

  @override
  ExportFormat createFormat() {
    return ExcelExportFormat(reportInfo);
  }
}

class CSVExportProcessor extends FileExportProcessor {
  CSVExportProcessor(super.reportInfo);

  @override
  ExportFormat createFormat() {
    return CSVExportFormat(reportInfo);
  }
}

class JsonExportProcessor extends FileExportProcessor {
  JsonExportProcessor(super.reportInfo);

  @override
  ExportFormat createFormat() {
    return JsonExportFormat(reportInfo);
  }
}
