import 'package:flutter/material.dart';
import 'package:flutter_samples/components/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterWebView extends StatefulWidget {
  const FlutterWebView({super.key, required this.url});
  final String url;
  @override
  State<FlutterWebView> createState() => _FlutterWebViewState();
}

class _FlutterWebViewState extends State<FlutterWebView> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text('Gen Goals'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
            javascriptMode: JavascriptMode.unrestricted, // Adjust as needed
          ),
          Visibility(
            visible: _isLoading,
            child: const Center(
                child: SpinKitChasingDots(
              color: AppColors.primaryColor,
              size: 30,
            )),
          ),
        ],
      ),
    );
  }
}
