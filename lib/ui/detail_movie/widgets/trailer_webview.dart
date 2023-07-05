import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(mediaPlaybackRequiresUserGesture: false, useShouldOverrideUrlLoading: true),
  android: AndroidInAppWebViewOptions(useHybridComposition: true),
  ios: IOSInAppWebViewOptions(allowsInlineMediaPlayback: true),
);

class TrailerWebview extends StatefulWidget {
  Uri url;
  String title;

  TrailerWebview({
    required this.url,
    required this.title,
  });

  @override
  State<TrailerWebview> createState() => _TrailerWebviewState();
}

class _TrailerWebviewState extends State<TrailerWebview> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Text(widget.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: InAppWebView(
        initialOptions: options,
        onWebViewCreated: (controller) async {
          try {
            final Uri url = widget.url;
            // then load your URL
            await controller.loadUrl(urlRequest: URLRequest(url: url));
            webViewController = controller;
          } catch (e, stackTrace) {
            debugPrint("Exception $e");
          }
        },
        androidOnGeolocationPermissionsShowPrompt: (controller, origin) async {
          return GeolocationPermissionShowPromptResponse(origin: origin, allow: true, retain: true);
        },
        onLoadStart: (controller, url) {
          // _isLoading = true;
          // LoadingDialog.show(context);
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
        },
        onLoadStop: (controller, url) async {
          // _stopRefreshing();
        },
        onLoadError: (controller, url, code, message) {
          // _stopRefreshing();
        },
        onProgressChanged: (controller, progress) {
          // if (progress == 100) _stopRefreshing();
        },
        onConsoleMessage: (controller, consoleMessage) {
          // debugPrint("consoleMessage");
          // debugPrint(json.encode(consoleMessage.toJson()));
        },
      ),
    );
  }
}
