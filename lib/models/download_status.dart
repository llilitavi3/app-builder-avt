class DownloadItem {
  late bool status;
  late String filename;
  late int progress;

  DownloadItem({
    this.status = false,
    this.filename = "",
    this.progress = 0
  });
}