// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViewScreen extends StatefulWidget {
//   final PrivacyTermsEnum status;
//   const WebViewScreen({super.key, required this.status});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late InAppWebViewController webViewCtrl;
//   String url = '';
//   bool showLoader = true;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.status == PrivacyTermsEnum.privacy) {
//       url = ApiConstant.privacyPolicy;
//     } else if (widget.status == PrivacyTermsEnum.terms) {
//       url = ApiConstant.termsAndCondition;
//     } else {
//       url = ApiConstant.about;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LoadingOverlay(
//       isLoading: showLoader,
//       child: Scaffold(
//           backgroundColor: white,
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(80),
//             child: appBarHeaderContainer(
//                 context: context, title: '', color: white),
//           ),
//           body: SafeArea(
//             child: Container(
//               color: white,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.only(left: 4.0, right: 4.0, bottom: 2.0),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: InAppWebView(
//                         initialUrlRequest: URLRequest(
//                             url: Uri.parse('${ApiConstant.baseUrl}$url')),
//                         onWebViewCreated: (controller) {
//                           setState(() {
//                             webViewCtrl = controller;
//                             showLoader = false;
//                           });
//                         },
//                         initialOptions: InAppWebViewGroupOptions(
//                           crossPlatform: InAppWebViewOptions(
//                               // Add WebView options here if needed
//                               ),
//                         ),
//                         onProgressChanged: (controller, progress) {},
//                         onLoadStop: (controller, url) {},
//                         onReceivedServerTrustAuthRequest:
//                             (controller, challenge) async {
//                           return ServerTrustAuthResponse(
//                               action: ServerTrustAuthResponseAction.PROCEED);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
