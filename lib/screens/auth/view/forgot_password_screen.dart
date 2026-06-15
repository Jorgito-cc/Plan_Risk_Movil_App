/* import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/auth/service/auth_controller.dart';
import 'package:mobile_plan_risk_3d/screens/auth/models/user_model.dart';
import 'package:mobile_plan_risk_3d/screens/widgets/input/custom_textfield.dart';

import '../../../../config/app_textstyles.dart';

import 'dart:ui';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate
      body: Stack(
        children: [
          // ===== Glowing Orbs =====
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withOpacity(0.15), // Violet
                boxShadow: [
                  BoxShadow(color: const Color(0xFF8B5CF6).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
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

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E293B).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.1),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 16,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Recuperar\nContraseña',
                                  style: AppTextStyle.withColor(
                                    AppTextStyle.h1,
                                    Colors.white,
                                  ).copyWith(fontSize: 32, fontWeight: FontWeight.w800),
                                ),
                                const SizedBox(height: 12),
                                Text('Ingresa tu correo para recibir un enlace de recuperación.',
                                  style: AppTextStyle.withColor(
                                    AppTextStyle.bodyLarge,
                                    Colors.white.withOpacity(0.7),
                                  ),
                                ),
                                const SizedBox(height: 36),

                                CustomTextfield(
                                  label: 'Correo electrónico',
                                  prefixIcon: Icons.email_rounded,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) return 'Ingresa tu correo';
                                    if (!GetUtils.isEmail(v)) return 'Correo inválido';
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 36),

                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // TODO: Lógica de recuperación
                                      Get.snackbar(
                                        'Enviado', 
                                        'Revisa tu bandeja de entrada',
                                        backgroundColor: const Color(0xFF06B6D4),
                                        colorText: Colors.white,
                                      );
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF8B5CF6), // Violet
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                      elevation: 8,
                                      shadowColor: const Color(0xFF8B5CF6).withOpacity(0.4),
                                    ),
                                    child: Text('Enviar enlace',
                                      style: AppTextStyle.withColor(AppTextStyle.buttonMedium, Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 void _handlePasswordReset(UserModel user, BuildContext context) {
  if (!GetUtils.isEmail(user.email)) {
    Get.snackbar('Error', 'Correo inválido');
    return;
  }

  final auth = Get.find<AuthController>();
  auth.sendResetLink(user.email); // ✅ aquí lo usas

  // Mostrar mensaje de éxito visual
  Get.dialog(
    AlertDialog(
      title: Text('Revisa tu correo', style: AppTextStyle.h3),
      content: Text(
        'Hemos enviado instrucciones de recuperación a ${user.email}.',
        style: AppTextStyle.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Aceptar',
            style: AppTextStyle.withColor(
              AppTextStyle.buttonMedium,
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}

}
 */