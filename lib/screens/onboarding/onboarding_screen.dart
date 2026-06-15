import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/auth/service/auth_controller.dart';

import '../../../config/app_textstyles.dart';
import '../../routes/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _items = <_OnboardingItem>[
    _OnboardingItem(
      title: 'Modelos 3D Automáticos',
      description:
          'Genera automáticamente modelos estructurales en 3D a partir de planos arquitectónicos.',
      image: 'assets/images/INT11.png',
    ),
    _OnboardingItem(
      title: 'Predicción de Riesgos',
      description:
          'Detecta riesgos potenciales en diseño y construcción usando IA.',
      image: 'assets/images/INT22.png',
    ),
    _OnboardingItem(
      title: 'Diseño Interno Asistido por IA',
      description:
          'Optimiza el diseño interno con asistencia de IA para mayor seguridad y eficiencia.',
      image: 'assets/images/INT33.png',
    ),
  ];

  void _handleGetStarted() {
    Get.find<AuthController>().setFirstTimeDone();
    Get.offAllNamed(AppRoutes.signin);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      body: Stack(
        children: [
          // ===== Glowing Orbs =====
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF06B6D4).withOpacity(0.15), // Cyan
                boxShadow: [
                  BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withOpacity(0.15), // Violet
                boxShadow: [
                  BoxShadow(color: const Color(0xFF8B5CF6).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),

          PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) {
              final it = _items[i];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    it.image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    it.title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h1,
                      Colors.white,
                    ).copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      it.description,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyLarge,
                        Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // ===== Puntos indicadores del slider =====
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? const Color(0xFF06B6D4)
                        : Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _handleGetStarted,
                  child: Text(
                    'Omitir',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _items.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      _handleGetStarted();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF06B6D4), // Cyan
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFF06B6D4).withOpacity(0.4),
                  ),
                  child: Text(
                    _currentPage < _items.length - 1 ? 'Siguiente' : 'Comenzar',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ).copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingItem {
  final String image, title, description;
  const _OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}
