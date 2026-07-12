import 'entities/report_info.dart';
import 'entities/row_item.dart';
import 'processor/file_export_processor.dart';

void main() {
  final reportInfo = ReportInfo('asd', 'Mohamed Adel', '1/1/2026', [
    RowItem('Chipsy', 3, 25.5),
    RowItem('Pepsi', 2, 20.5),
  ]);
  final fileExportProcessor = JsonExportProcessor(reportInfo);
  fileExportProcessor.saveAndGenerateFile();
}
