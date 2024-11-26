import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String paymentUrl;

  const PaymentPage({Key? key, required this.paymentUrl}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    print("initState url ${widget.paymentUrl}");
    super.initState();
    // Initialize the WebView platform
    WebViewPlatform.instance;

    // Initialize WebViewController after the platform is ready
    _initializeWebView();
  }


  @override
  void dispose() {
    if (_webViewController != null) {
      _webViewController.clearCache();
    }
    super.dispose();
  }
  // Initialize WebViewController and load the URL
  void _initializeWebView() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            _isLoading = true;
          });
        },
        onWebResourceError: (WebResourceError error) {
          print("Error occurred: ${error.description}");
          setState(() {
            _isLoading = false;
          });
          // Optionally show an error message or redirect to a failure screen.
        },

        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
          print('Page finished loading: $url');
          final uri = Uri.parse(url);
          if (uri.path.contains('success')) {
            _handlePaymentSuccess();
          } else if (uri.path.contains('failed')) {
            _handlePaymentFailure();
          }

        },
      ));

    // Load the payment URL
    _webViewController.loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إتمام عملية الدفع'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          _isLoading
              ? Center(child: CircularProgressIndicator()) // Loading indicator
              : Container(), // Hide loading when the page finishes
        ],
      ),
    );
  }

  // Handle payment success
  void _handlePaymentSuccess() {
    print("الدفع تم بنجاح");
    Navigator.pop(context, true);
  }

  // Handle payment failure
  void _handlePaymentFailure() {
    print("فشلت عملية الدفع");
    Navigator.pop(context, false);
  }
}
