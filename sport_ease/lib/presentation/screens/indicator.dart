// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Pastikan pustaka ini terpasang

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: PageViewExample(),
// //     );
// //   }
// // }

// class PageViewExample extends StatefulWidget {
//   @override
//   _PageViewExampleState createState() => _PageViewExampleState();
// }

// class _PageViewExampleState extends State<PageViewExample> {
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           PageView(
//             controller: _pageController,
//             children: [
//               Center(child: Text("Page 1", style: TextStyle(fontSize: 24))),
//               Center(child: Text("Page 2", style: TextStyle(fontSize: 24))),
//               Center(child: Text("Page 3", style: TextStyle(fontSize: 24))),
//             ],
//           ),
//           Positioned(
//             bottom: 50,
//             child: SmoothPageIndicator(
//               controller: _pageController,
//               count: 3,
//               effect: ExpandingDotsEffect(
//                 dotWidth: 8,
//                 dotHeight: 8,
//                 activeDotColor: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
