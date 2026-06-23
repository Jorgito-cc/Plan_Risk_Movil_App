import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/config/theme_controller.dart';
import 'package:mobile_plan_risk_3d/screens/main/sidebar/widget/plan_premiun.dart';
import 'package:mobile_plan_risk_3d/screens/main/sidebar/widget/soporte_ayuda.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

class ConfigOptionsCard extends StatelessWidget {
  const ConfigOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ====== Efectos de luz de fondo ======
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF06B6D4).withOpacity(0.1), // Cyan
              boxShadow: [
                BoxShadow(color: const Color(0xFF06B6D4).withOpacity(0.2), blurRadius: 100),
              ],
            ),
          ),
        ),
        
        // ====== Contenido ======
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado
                Row(
                  children: [
                    const Icon(Icons.settings_rounded, size: 30, color: Color(0xFF06B6D4)),
                    const SizedBox(width: 10),
                    Text(
                      'Configuración',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Tarjeta Glassmorphism con opciones
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
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
                          AnimatedOption(
                            icon: Icons.corporate_fare_rounded,
                            label: 'Sobre Plan Risk 3D',
                            iconColor: const Color(0xFF06B6D4), // Cyan
                            onTap: () => _showInfoDialog(context, 'Sobre Plan Risk 3D', 'Plan Risk 3D es una empresa dedicada a la generación inteligente de estructuras 3D, facilitando la planificación y visualización de proyectos mediante inteligencia artificial y tecnología inmersiva.'),
                          ),
                          AnimatedOption(
                            icon: Icons.code_rounded,
                            label: 'Tecnologías que usamos',
                            iconColor: const Color(0xFF8B5CF6), // Violet
                            onTap: () => _showInfoDialog(context, 'Tecnologías que usamos', 'Nuestro ecosistema tecnológico está potenciado por:\n\n• Backend: Django REST Framework y Python.\n• Frontend Web: React.js y TailwindCSS.\n• App Móvil: Flutter.\n• Modelado 3D: Three.js y Model Viewer.\n• IA: Algoritmos de visión computacional y modelos de generación paramétrica.'),
                          ),
                          AnimatedOption(
                            icon: Icons.star_rounded,
                            label: 'Nuestros Planes',
                            iconColor: const Color(0xFFF59E0B), // Amber
                            onTap: () => _showInfoDialog(context, 'Nuestros Planes', 'Ofrecemos diferentes niveles de suscripción adaptados a tus necesidades:\n\n1. Plan Básico: Visualización 3D estándar.\n2. Plan Premium: Herramientas avanzadas de edición y exportación.\n3. Plan Enterprise: Soporte prioritario y modelos ilimitados.'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(color: Colors.white.withOpacity(0.1), height: 24),
                          ),
                          AnimatedOption(
                            icon: Icons.help_outline_rounded,
                            label: 'Ayuda & Soporte',
                            iconColor: const Color(0xFF10B981), // Emerald
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HelpSupportScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Pie de versión
                Center(
                  child: Text(
                    'Versión 1.0.0',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B).withOpacity(0.85),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.8),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (title == 'Nuestros Planes')
                          TextButton(
                            onPressed: () async {
                               final url = Uri.parse('https://defensasw2.jorgechoquecalle.engineer/');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              }
                            },
                            child: const Text(
                              'Aceptar Plan',
                              style: TextStyle(color: Color(0xFF10B981), fontWeight: FontWeight.bold),
                            ),
                          ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cerrar',
                            style: TextStyle(color: Color(0xFF06B6D4), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedOption extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback? onTap;

  const AnimatedOption({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    this.onTap,
  });

  @override
  State<AnimatedOption> createState() => _AnimatedOptionState();
}

class _AnimatedOptionState extends State<AnimatedOption> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.97);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: () {
        setState(() => _scale = 1.0);
        widget.onTap?.call();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(widget.icon, color: widget.iconColor, size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: Colors.white.withOpacity(0.3)),
            ],
          ),
        ),
      ),
    );
  }
}
