import 'dart:ui';
import 'package:flutter/material.dart';
class PillBottomNav extends StatelessWidget {
  const PillBottomNav({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: Container(
                height: 68,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B).withOpacity(0.65), // Dark glass
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ===== Inicio / Dashboard =====
                    _NavBtnAnimated(
                      isActive: index == 0,
                      activeColor: const Color(0xFF06B6D4), // Cyan
                      icon: Icons.dashboard_rounded,
                      onTap: () => onTap(0),
                    ),

                    // ===== Visualizador 3D =====
                    _NavBtnAnimated(
                      isActive: index == 1,
                      activeColor: const Color(0xFF10B981), // Emerald
                      icon: Icons.view_in_ar_rounded,
                      onTap: () => onTap(1),
                    ),

                    // ===== Perfil =====
                    _NavBtnAnimated.filled(
                      isActive: index == 2,
                      fillColor: const Color(0xFFF59E0B), // Amber
                      icon: Icons.person_rounded,
                      onTap: () => onTap(2),
                    ),

                    // ===== Mis Modelos =====
                    _NavBtnAnimated(
                      isActive: index == 3,
                      activeColor: const Color(0xFF8B5CF6), // Violet
                      icon: Icons.auto_awesome_rounded,
                      onTap: () => onTap(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavBtnAnimated extends StatelessWidget {
  const _NavBtnAnimated({
    required this.isActive,
    required this.icon,
    required this.onTap,
    required this.activeColor,
  })  : filled = false,
        fillColor = null;

  const _NavBtnAnimated.filled({
    required this.isActive,
    required this.icon,
    required this.onTap,
    required this.fillColor,
  })  : filled = true,
        activeColor = null;

  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final Color? activeColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final duration = const Duration(milliseconds: 300);
    final iconColor = filled
        ? Colors.white
        : (isActive ? activeColor! : const Color(0xFF64748B)); // Gris slate cuando inactivo

    return AnimatedScale(
      duration: duration,
      scale: isActive ? 1.15 : 1.0,
      curve: Curves.easeOutBack,
      child: AnimatedOpacity(
        duration: duration,
        opacity: isActive ? 1 : 0.7,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: AnimatedContainer(
            duration: duration,
            curve: Curves.easeOutCubic,
            height: 48,
            width: filled ? 48 : 44,
            decoration: BoxDecoration(
              color: filled
                  ? (isActive
                      ? fillColor!
                      : fillColor!.withOpacity(0.5))
                  : (isActive ? activeColor!.withOpacity(0.15) : Colors.transparent),
              borderRadius: BorderRadius.circular(24),
              boxShadow: filled && isActive
                  ? [
                      BoxShadow(
                        color: fillColor!.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 24, color: iconColor),
          ),
        ),
      ),
    );
  }
}
