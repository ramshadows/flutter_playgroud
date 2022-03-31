import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fooderlich3/components/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/webview_navigation_controls.dart';
import '../models/models.dart';

class WebViewScreen extends StatefulWidget {
  // WebViewScreen MaterialPage Helper
  // Here, you create a static MaterialPage that wraps a WebView screen widget.
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.raywenderlich,
      key: ValueKey(FooderlichPages.raywenderlich),
      child: const WebViewScreen(),
    );
  }

  const WebViewScreen({Key? key}) : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {
  final controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raywenderlich.com'),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(
        controller: controller,
      ),
    );
  }
}
