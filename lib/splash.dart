// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:meddetect/core/theme/app_pallete.dart';
import 'package:meddetect/features/auth/presentation/pages/login_page.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     });
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: AppPallete.backgroundColor, // Set background color here
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/cat6.png',
//             width: 100,
//             height: 100,
//           ),
//           SizedBox(height: 40),
//           CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:async';
// import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14, // 2 * pi for full rotation
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.repeat(); // Repeat the animation indefinitely

    Timer(Duration(seconds: 5), () {
      _controller.stop(); // Stop the rotation animation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image with low exposure
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Set low exposure here
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.002) // Perspective
                    
                    ..rotateY(_rotationAnimation.value),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/med1.png',
                    width: 100,
                    height: 100,
                  ),
                ),
          //      Padding(
          //   padding: const EdgeInsetsDirectional.only(top:300),
          //   child: CircularProgressIndicator(
          //           valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          //         ),
          // ),
                
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}

