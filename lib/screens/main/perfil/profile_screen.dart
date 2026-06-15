import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/auth/service/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark slate background
      body: Stack(
        children: [
          // ===== Fondo con resplandor abstracto =====
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF06B6D4).withOpacity(0.15), // Cyan glow
                boxShadow: [
                  BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.2), blurRadius: 100),
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.15), // Blue glow
                boxShadow: [
                  BoxShadow(color: const Color(0xFF3B82F6).withOpacity(0.2), blurRadius: 120),
                ],
              ),
            ),
          ),

          // ===== Contenido =====
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 100), // padding extra abajo para el bottom nav flotante
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ===== Título =====
                  const Text(
                    'Mi Perfil',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 36),

                  // ===== Avatar + Tarjeta Glassmorphism =====
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // Fondo de tarjeta
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(20, 80, 20, 26),
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
                                children: [
                                  // ==== Datos de usuario ====
                                  Obx(() {
                                    final u = auth.currentUser.value;
                                    final name = u?.nombre ?? 'Usuario';
                                    final email = u?.email ?? 'correo@no-disponible.com';
                                    final userId = u?.id?.toString() ?? 'N/A';

                                    return Column(
                                      children: [
                                        Text(
                                          name.isEmpty ? 'Usuario' : name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          email,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white.withOpacity(0.7),
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF06B6D4).withOpacity(0.2),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: const Color(0xFF06B6D4).withOpacity(0.5)),
                                          ),
                                          child: Text(
                                            'ID: $userId  |  Rol: Premium',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF06B6D4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),

                                  const SizedBox(height: 36),

                                  // ==== Botones ====
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: () =>
                                              _showEditDialog(context, auth),
                                          icon: const Icon(
                                            Icons.edit_rounded,
                                            color: Color(0xFF06B6D4), // Cyan
                                            size: 20,
                                          ),
                                          label: const Text(
                                            'Editar',
                                            style: TextStyle(
                                              color: Color(0xFF06B6D4),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                              color: Color(0xFF06B6D4),
                                              width: 1.5,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: () => auth.logout(),
                                          icon: const Icon(
                                            Icons.logout_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          label: const Text(
                                            'Salir',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFEF4444), // Red
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 16,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            elevation: 8,
                                            shadowColor: const Color(0xFFEF4444).withOpacity(0.4),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 36),

                                  // ==== Mensaje de seguridad ====
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF10B981).withOpacity(0.1), // Emerald tint
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: const Color(0xFF10B981).withOpacity(0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.shield_rounded,
                                          color: Color(0xFF10B981),
                                          size: 24,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            'Tus datos están protegidos con seguridad avanzada.',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white.withOpacity(0.9),
                                              height: 1.4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // ==== Avatar circular con borde neón ====
                      Positioned(
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF0F172A), width: 6), // Fondo base
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF06B6D4).withOpacity(0.4),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: const Color(0xFF06B6D4).withOpacity(0.2),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/avatar.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==== Modal para editar perfil ====
  void _showEditDialog(BuildContext context, AuthController auth) {
    final u = auth.currentUser.value;
    final nameCtrl = TextEditingController(text: u?.nombre ?? '');
    final emailCtrl = TextEditingController(text: u?.email ?? '');
    final passCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B).withOpacity(0.85),
                border: Border(
                  top: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
                ),
              ),
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20, left: 140, right: 140),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Editar Perfil',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _FancyField(
                    controller: nameCtrl,
                    label: 'Nombre',
                    icon: Icons.person_rounded,
                  ),
                  const SizedBox(height: 16),
                  _FancyField(
                    controller: emailCtrl,
                    label: 'Correo',
                    icon: Icons.email_rounded,
                  ),
                  const SizedBox(height: 16),
                  _FancyField(
                    controller: passCtrl,
                    label: 'Contraseña nueva',
                    icon: Icons.lock_rounded,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      await auth.updateProfile(
                        nombre: nameCtrl.text.trim(),
                        password: passCtrl.text.trim(),
                      );
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06B6D4), // Cyan
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 8,
                      shadowColor: const Color(0xFF06B6D4).withOpacity(0.4),
                    ),
                    child: const Text(
                      'Guardar cambios',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// === Campo reutilizable ===
class _FancyField extends StatelessWidget {
  const _FancyField({
    required this.controller,
    required this.label,
    required this.icon,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF94A3B8)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF06B6D4), width: 1.5),
        ),
      ),
    );
  }
}
