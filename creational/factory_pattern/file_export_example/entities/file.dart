class File {
  final String name;
  final Format format;
  Status status = Status.generated;
  File(this.name, this.format);
}

enum Format { Pdf, Excel, Csv, Json }

enum Status { generated, saved }
