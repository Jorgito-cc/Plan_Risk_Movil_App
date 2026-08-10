import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_plan_risk_3d/screens/auth/models/user_model.dart';
import 'package:mobile_plan_risk_3d/screens/auth/service/auth_controller.dart';
import 'package:mobile_plan_risk_3d/screens/widgets/input/custom_textfield.dart';

import '../../../../config/app_textstyles.dart';
import '../../../routes/routes.dart';

import 'dart:ui';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String _profession = 'estudiante';
  String? _birthDate;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      Get.snackbar(
        'Requisito',
        'Debes aceptar los Términos y Condiciones y Políticas de Privacidad.',
        backgroundColor: const Color(0xFFEF4444).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    final user = UserModel(
      nombre: _nameController.text.trim(),
      apellido: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      profesion: _profession,
      fechaNacimiento: _birthDate,
      telefono: int.tryParse(_phoneController.text.trim()),
      aceptaPoliticas: _acceptTerms,
      fechaAceptacion: DateTime.now().toIso8601String(),
    );
    Get.find<AuthController>().register(user);
  }

  Future<void> _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF3B82F6),
              onPrimary: Colors.white,
              surface: Color(0xFF1E293B),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _birthDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: const Color(0xFF0F172A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Términos y Condiciones',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        '1. Aceptación de los Términos\nAl registrarse y utilizar los servicios de la plataforma Plan Risk 3D, usted acepta cumplir y estar sujeto a los siguientes términos y condiciones de servicio. Si no está de acuerdo con alguna parte de estos términos, no debe acceder al software.\n\n'
                        '2. Descripción del Servicio (Licencia SaaS)\nPlan Risk 3D es una plataforma de software en la nube bajo la modalidad SaaS que proporciona herramientas de modelado tridimensional de planos arquitectónicos y simulación de riesgos estructurales asistidos por Inteligencia Artificial (Mask R-CNN y Gemini).\n\n'
                        '3. Limitación de Responsabilidad Técnica\nIMPORTANTE: Todos los cálculos, predicciones de riesgos, modelos 3D y reportes generados por la Inteligencia Artificial de Plan Risk 3D son herramientas de asistencia técnica computacional preliminar y NO reemplazan el criterio profesional de un Ingeniero Civil o Ingeniero Estructural colegiado. La empresa no asume responsabilidad civil ni legal por daños directos o indirectos, fallas de construcción o colapsos.\n\n'
                        '4. Uso Aceptable de la Cuenta\nUsted se compromete a no utilizar el sistema para subir archivos corruptos, planos que violen derechos de autor de terceros o ejecutar scripts maliciosos.',
                        style: TextStyle(color: Colors.white.withOpacity(0.8), height: 1.5),
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

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            backgroundColor: const Color(0xFF0F172A),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Política de Privacidad',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        '1. Información que Recopilamos\nRecopilamos la información estrictamente necesaria para brindar nuestros servicios SaaS:\n'
                        '- Datos de Registro: Nombre completo, apellido, dirección de correo electrónico, contraseña, teléfono y profesión.\n'
                        '- Datos Técnicos: Archivos de planos arquitectónicos (PDF, PNG, JPG, CAD) y los modelos 3D resultantes.\n\n'
                        '2. Uso de la Información\nSus datos y planos se utilizan únicamente para procesar los modelos 3D estructurales mediante nuestra red neuronal Mask R-CNN y realizar análisis de daños vía Gemini AI. No compartimos su información con terceros.\n\n'
                        '3. Seguridad y Auditoría en Blockchain\nPara garantizar la inmutabilidad y transparencia de las auditorías de riesgo estructural generadas en la plataforma, registramos los hashes criptográficos (huellas digitales) de los reportes en una cadena de bloques (Blockchain).',
                        style: TextStyle(color: Colors.white.withOpacity(0.8), height: 1.5),
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
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.all(28),
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Crear cuenta',
                              style: AppTextStyle.withColor(
                                AppTextStyle.h1,
                                Colors.white,
                              ).copyWith(fontSize: 28, fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(height: 8),
                            Text('Ingresa tus datos para registrarte.',
                              style: AppTextStyle.withColor(
                                AppTextStyle.bodyLarge,
                                Colors.white.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 24),
                            CustomTextfield(
                              label: 'Nombre',
                              prefixIcon: Icons.person_rounded,
                              keyboardType: TextInputType.name,
                              controller: _nameController,
                              validator: (v) => (v == null || v.isEmpty) ? 'Ingresa tu nombre' : null,
                            ),
                            const SizedBox(height: 14),
                            CustomTextfield(
                              label: 'Apellido',
                              prefixIcon: Icons.person_outline_rounded,
                              keyboardType: TextInputType.name,
                              controller: _lastNameController,
                              validator: (v) => (v == null || v.isEmpty) ? 'Ingresa tu apellido' : null,
                            ),
                            const SizedBox(height: 14),
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
                            const SizedBox(height: 14),
                            CustomTextfield(
                              label: 'Contraseña',
                              prefixIcon: Icons.lock_rounded,
                              keyboardType: TextInputType.visiblePassword,
                              isPassword: true,
                              controller: _passwordController,
                              validator: (v) => (v == null || v.isEmpty) ? 'Ingresa una contraseña' : null,
                            ),
                            const SizedBox(height: 14),
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
                            const SizedBox(height: 14),
                            CustomTextfield(
                              label: 'Teléfono / Celular',
                              prefixIcon: Icons.phone_android_rounded,
                              keyboardType: TextInputType.phone,
                              controller: _phoneController,
                              validator: (v) {
                                if (v == null || v.isEmpty) return 'Ingresa tu teléfono';
                                if (int.tryParse(v) == null) return 'Ingresa un número válido';
                                return null;
                              },
                            ),
                            const SizedBox(height: 14),
                            
                            DropdownButtonFormField<String>(
                              value: _profession,
                              dropdownColor: const Color(0xFF1E293B),
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Profesión',
                                labelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                prefixIcon: Icon(Icons.work_rounded, color: Colors.white.withOpacity(0.6)),
                                filled: true,
                                fillColor: Colors.black.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'estudiante', child: Text('Estudiante')),
                                DropdownMenuItem(value: 'profesional', child: Text('Profesional')),
                                DropdownMenuItem(value: 'otro', child: Text('Otro')),
                              ],
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() {
                                    _profession = val;
                                  });
                                }
                              },
                            ),
                            const SizedBox(height: 14),

                            InkWell(
                              onTap: _selectBirthDate,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_month_rounded, color: Colors.white.withOpacity(0.6)),
                                    const SizedBox(width: 12),
                                    Text(
                                      _birthDate ?? 'Fecha de nacimiento',
                                      style: TextStyle(
                                        color: _birthDate == null ? Colors.white.withOpacity(0.6) : Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Checkbox(
                                    value: _acceptTerms,
                                    activeColor: const Color(0xFF3B82F6),
                                    checkColor: Colors.white,
                                    side: BorderSide(color: Colors.white.withOpacity(0.6)),
                                    onChanged: (val) {
                                      setState(() {
                                        _acceptTerms = val ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 13, height: 1.4),
                                      children: [
                                        const TextSpan(text: 'Acepto los '),
                                        TextSpan(
                                          text: 'Términos y Condiciones',
                                          style: const TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()..onTap = _showTermsDialog,
                                        ),
                                        const TextSpan(text: ' y la '),
                                        TextSpan(
                                          text: 'Política de Privacidad',
                                          style: const TextStyle(color: Color(0xFF3B82F6), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()..onTap = _showPrivacyDialog,
                                        ),
                                        const TextSpan(text: ' de Plan Risk 3D.'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 28),
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
                            const SizedBox(height: 24),
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
          ),
        ],
      ),
    );
  }
}
