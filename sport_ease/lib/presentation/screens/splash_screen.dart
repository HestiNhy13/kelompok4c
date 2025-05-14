import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; 
import 'opening_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();//untuk swip antar halaman

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2193b0), Color(0xFF6dd5ed)], // Biru gradasi
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            children: [
              LogoAnimationPage(),
              OpeningScreen(),
            ],
          ),
          Positioned(
            bottom: 50,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}}

class LogoAnimationPage extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Membersihkan controller agar tidak ada kebocoran memori
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset('assets/image/logo.png', width: 300),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart'; 
// import '../screen/opening_screen.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final PageController _pageController = PageController();
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       int newIndex = _pageController.page!.round();
//       if (newIndex != currentIndex) {
//         setState(() {
//           currentIndex = newIndex;
//         });
//       }
//     });
//   }

//   void _goToNextPage() {
//     _pageController.animateToPage(
//       currentIndex + 1,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.ease,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           PageView(
//             controller: _pageController,
//             children: [
//               LogoAnimationPage(),
//               OpeningScreen(),
//             ],
//           ),
//           Positioned(
//             bottom: 50,
//             child: SmoothPageIndicator(
//               controller: _pageController,
//               count: 2,
//               effect: ExpandingDotsEffect(
//                 dotWidth: 8,
//                 dotHeight: 8,
//                 activeDotColor: Colors.black,
//               ),
//             ),
//           ),
//           // Tombol hanya muncul di halaman pertama
//           if (currentIndex == 0)
//             Positioned(
//               right: 20,
//               bottom: 40,
//               child: IconButton(
//                 icon: Icon(Icons.arrow_forward, size: 30),
//                 onPressed: _goToNextPage,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// class LogoAnimationPage extends StatefulWidget {
//   @override
//   _LogoAnimationState createState() => _LogoAnimationState();
// }

// class _LogoAnimationState extends State<LogoAnimationPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); 
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FadeTransition(
//         opacity: _animation,
//         child: ScaleTransition(
//           scale: _animation,
//           child: Image.asset('assets/image/logo.png', width: 300),
//         ),
//       ),
//     );
//   }
// }
