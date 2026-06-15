import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/auth/models/user_model.dart';
import 'package:mobile_plan_risk_3d/screens/auth/service/auth_controller.dart';
import 'package:mobile_plan_risk_3d/screens/widgets/input/custom_textfield.dart';

import '../../../../config/app_textstyles.dart';
import '../../../routes/routes.dart';

import 'dart:ui';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _handleSignUp() {
    final user = UserModel(
      nombre: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    Get.find<AuthController>().register(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.15),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF3B82F6).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10B981).withOpacity(0.15),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF10B981).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
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
                          Text('Crear cuenta',
                            style: AppTextStyle.withColor(
                              AppTextStyle.h1,
                              Colors.white,
                            ).copyWith(fontSize: 32, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 12),
                          Text('Ingresa tus datos para registrarte.',
                            style: AppTextStyle.withColor(
                              AppTextStyle.bodyLarge,
                              Colors.white.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 36),
                          CustomTextfield(
                            label: 'Nombre completo',
                            prefixIcon: Icons.person_rounded,
                            keyboardType: TextInputType.name,
                            controller: _nameController,
                            validator: (v) => (v == null || v.isEmpty) ? 'Ingresa tu nombre' : null,
                          ),
                          const SizedBox(height: 16),
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
                          const SizedBox(height: 16),
                          CustomTextfield(
                            label: 'Contraseña',
                            prefixIcon: Icons.lock_rounded,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            controller: _passwordController,
                            validator: (v) => (v == null || v.isEmpty) ? 'Ingresa una contraseña' : null,
                          ),
                          const SizedBox(height: 16),
                          CustomTextfield(
                            label: 'Confirmar contraseña',
                            prefixIcon: Icons.lock_clock_rounded,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            controller: _confirmPasswordController,
                            validator: (v) {
                              if (v != _passwordController.text) return 'Las contraseñas no coinciden';
                              return null;
                            },
                          ),
                          const SizedBox(height: 36),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _handleSignUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3B82F6),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                elevation: 8,
                                shadowColor: const Color(0xFF3B82F6).withOpacity(0.4),
                              ),
                              child: Text('Registrarme',
                                style: AppTextStyle.withColor(AppTextStyle.buttonMedium, Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text("¿Ya tienes una cuenta?",
                                style: AppTextStyle.withColor(
                                  AppTextStyle.bodyMedium,
                                  Colors.white.withOpacity(0.7),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text('Iniciar sesión',
                                  style: AppTextStyle.withColor(
                                    AppTextStyle.buttonMedium,
                                    const Color(0xFF3B82F6),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
