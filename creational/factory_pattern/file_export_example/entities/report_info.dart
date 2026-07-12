import 'row_item.dart';

class ReportInfo {
  final String title;
  final String createdBy;
  final String creationDate;
  final List<RowItem> rows;

  ReportInfo(this.title, this.createdBy, this.creationDate, this.rows);
}
