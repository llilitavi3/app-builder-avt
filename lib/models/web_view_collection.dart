import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewCollection {
  late InAppWebViewController? webExplorerController;
  late PullToRefreshController? pullToRefreshController;
  late String url;
  late bool isLoading;
  late String title;
  late bool error;

  WebViewCollection({
    this.webExplorerController,
    this.pullToRefreshController,
    required this.url,
    required this.isLoading,
    required this.title,
    required this.error
  });

}