import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/service/auth_controller.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (_auth.isFirstTime) {
        Get.offAllNamed(AppRoutes.onboarding);
      } else if (_auth.isLoggedIn) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.signin);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      body: Stack(
        children: [
          // ===== Glowing Orbs =====
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF06B6D4).withOpacity(0.2), // Cyan
                boxShadow: [
                  BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.3), blurRadius: 120),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.15), // Blue
                boxShadow: [
                  BoxShadow(color: const Color(0xFF3B82F6).withOpacity(0.25), blurRadius: 120),
                ],
              ),
            ),
          ),
          Positioned.fill(child: Opacity(opacity: 0.03, child: GridPattern(color: Colors.white))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (_, v, __) {
                    return Transform.scale(
                      scale: v,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E293B).withOpacity(0.8), // Dark glass
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF06B6D4).withOpacity(0.5), width: 1.5),
                          boxShadow: [
                            BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.4), blurRadius: 20, spreadRadius: 2, offset: const Offset(0, 4))
                          ],
                        ),
                        child: const Icon(Icons.architecture_rounded, size: 48, color: Color(0xFF06B6D4)), // Cyan
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (_, v, __) => Opacity(
                    opacity: v,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - v)),
                      child: Column(
                        children: const [
                          Text('PLAN RISK', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300, letterSpacing: 8)),
                          SizedBox(height: 4),
                          Text('3D', style: TextStyle(color: const Color(0xFF06B6D4), fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: 4)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 48, left: 0, right: 0,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1200),
              builder: (_, v, child) => Opacity(opacity: v, child: child),
              child: Text(
                'Generación inteligente de estructuras 3D',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13, letterSpacing: 1.5, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridPattern extends StatelessWidget {
  final Color color;
  const GridPattern({super.key, required this.color});

  @override
  Widget build(BuildContext context) => CustomPaint(painter: GridPainter(color: color));
}

class GridPainter extends CustomPainter {
  final Color color;
  GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color..strokeWidth = 0.5;
    const spacing = 20.0;
    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
