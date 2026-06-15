import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/dasboard/view/dashboard_screen.dart';
import 'package:mobile_plan_risk_3d/screens/main/planVisualizador/visualizador3dPage.dart';
import 'package:mobile_plan_risk_3d/screens/main/sidebar/widget/ConfigOptionsCard.dart';
import 'package:mobile_plan_risk_3d/screens/main/sidebar/widget/DiseñoIA.dart';
import 'package:mobile_plan_risk_3d/screens/main/sidebar/view/sidebar.dart';
import 'package:mobile_plan_risk_3d/screens/view/glb_viewer_page.dart';

import '../auth/service/auth_controller.dart';
import '../../routes/routes.dart';
import '../widgets/navegacion/pill_bottom_nav.dart';
import 'perfil/profile_screen.dart';
import 'dart:ui';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = Get.find<AuthController>();
  int _selectedIndex = 0;
  bool _isSidebarOpen = false;

  final List<Widget> _pages = const [
    DashboardScreen(),
    //Center(child: Text('Dashboard / Estadísticas')),
    Visualizador3dPage(),
    ProfileScreen(),
   // Center(child: Text('Diseño IA')),
     IADisenoScreen(),
    //Center(child: Text('Configuraciones')),
    ConfigOptionsCard() , 
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _isSidebarOpen = false;
    });
  }

  bool get _isMobile => MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Fondo principal oscuro
      drawer: _isMobile
          ? Drawer(
              width: 280,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Sidebar(
                    selectedIndex: _selectedIndex,
                    onItemSelected: (index) {
                      _onItemSelected(index);
                      Navigator.pop(context);
                    },
                    onLogout: () {
                      _auth.logout();
                      Get.offAllNamed(AppRoutes.signin);
                    },
                  ),
                ),
              ),
            )
          : null,
      body: Row(
        children: [
          if (!_isMobile)
            Sidebar(
              selectedIndex: _selectedIndex,
              onItemSelected: _onItemSelected,
              onLogout: () {
                _auth.logout();
                Get.offAllNamed(AppRoutes.signin);
              },
            ),
          Expanded(
            child: Column(
              children: [
                if (_isMobile)
                  SafeArea(
                    bottom: false,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B).withOpacity(0.6),
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.white12,
                                width: 1,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Builder(
                                builder: (context) => IconButton(
                                  icon: const Icon(Icons.menu_rounded, color: Colors.white),
                                  onPressed: () => Scaffold.of(context).openDrawer(),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  'Plan Risk 3D',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              IconButton(
                                tooltip: 'Viewer 3D',
                                onPressed: () => Get.to(() => const GlbViewerPage()),
                                icon: const Icon(Icons.view_in_ar_rounded),
                                color: const Color(0xFF94A3B8),
                              ),
                              IconButton(
                                tooltip: 'Perfil',
                                onPressed: () => _onItemSelected(2),
                                icon: const Icon(Icons.person_rounded),
                                color: const Color(0xFF94A3B8),
                              ),
                              IconButton(
                                tooltip: 'Logout',
                                onPressed: () {
                                  _auth.logout();
                                  Get.offAllNamed(AppRoutes.signin);
                                },
                                icon: const Icon(Icons.logout_rounded),
                                color: const Color(0xFFEF4444),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _pages,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _isMobile
          ? PillBottomNav(index: _selectedIndex, onTap: _onItemSelected)
          : null,
    );
  }
}
