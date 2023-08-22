import 'package:flutter/material.dart';
import 'package:ponpescondong/pages/pdf_viewer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  final String url = 'https://app.baiturrahman-df.sch.id/';
  final String pdfUrl =
      'https://app.baiturrahman-df.sch.id/file/perpustakaan/digital/';

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100) {}
          },
          onPageStarted: (String url) {
            debugPrint('started: $url');
          },
          onPageFinished: (String url) {
            debugPrint('finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            debugPrint('request: ${request.url}');
            // if (request.url.startsWith(pdfUrl)) {
            if (request.url.contains('.pdf')) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PdfViewerPage(url: request.url),
              ));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
