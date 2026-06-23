import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:ui';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback onLogout;

  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 260,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B).withOpacity(0.6), // Glassmorphism dark
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(4, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Header
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)], // Cyan to Blue
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF06B6D4).withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.home_work_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Text(
                      "Plan Risk 3D",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 🔹 Menu items
                _SidebarItem(
                  icon: Icons.dashboard_rounded,
                  label: 'Inicio',
                  isSelected: selectedIndex == 0,
                  accentColor: const Color(0xFF06B6D4), // Cyan
                  onTap: () => onItemSelected(0),
                ),
                _SidebarItem(
                  icon: Icons.view_in_ar_rounded,
                  label: 'Visualizador 3D',
                  isSelected: selectedIndex == 1,
                  accentColor: const Color(0xFF10B981), // Emerald
                  onTap: () => onItemSelected(1),
                ),
                _SidebarItem(
                  icon: Icons.layers_rounded,
                  label: 'Mi Perfil',
                  isSelected: selectedIndex == 2,
                  accentColor: const Color(0xFFF59E0B), // Amber
                  onTap: () => onItemSelected(2),
                ),
                _SidebarItem(
                  icon: Icons.auto_awesome_rounded,
                  label: 'IA Diseño',
                  isSelected: selectedIndex == 3,
                  accentColor: const Color(0xFF8B5CF6), // Violet
                  onTap: () => onItemSelected(3),
                ),
                _SidebarItem(
                  icon: Icons.settings_rounded,
                  label: 'Configuración',
                  isSelected: selectedIndex == 4,
                  accentColor: const Color(0xFF64748B), // Slate
                  onTap: () => onItemSelected(4),
                ),
                _SidebarItem(
                  icon: Icons.smart_toy_rounded,
                  label: 'Asistente IA (Voz)',
                  isSelected: selectedIndex == 5,
                  accentColor: const Color(0xFFEAB308), // Yellow
                  onTap: () => onItemSelected(5),
                ),

                const Spacer(),

                Divider(thickness: 1, color: Colors.white.withOpacity(0.1)),
                const SizedBox(height: 12),

                // 🔹 Logout
                _SidebarItem(
                  icon: Icons.logout_rounded,
                  label: 'Salir',
                  isSelected: false,
                  accentColor: const Color(0xFFEF4444), // Red
                  onTap: onLogout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color accentColor;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        splashColor: accentColor.withOpacity(0.2),
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          decoration: BoxDecoration(
            color: isSelected
                ? accentColor.withOpacity(0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: isSelected
                ? Border.all(color: accentColor.withOpacity(0.5), width: 1)
                : Border.all(color: Colors.transparent, width: 1),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: accentColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? accentColor : const Color(0xFF94A3B8),
                size: 24,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.chevron_right_rounded,
                  color: accentColor.withOpacity(0.8),
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
