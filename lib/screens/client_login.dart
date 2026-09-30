import 'package:flutter/material.dart';
import 'client_register.dart';

class ClientLoginPage extends StatefulWidget {
  const ClientLoginPage({super.key});

  @override
  State<ClientLoginPage> createState() => _ClientLoginPageState();
}

class _ClientLoginPageState extends State<ClientLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool rememberMe = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFE),
      body: SafeArea(
        child: Stack(
          children: [
            // Background construction image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 430,
              child: Image.network(
                'https://images.unsplash.com/photo-1600585154340-be6161a56a0c'
                '?auto=format&fit=crop&w=1000&q=80',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFEAF3FB),
                  );
                },
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 430,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.88),
                      Colors.white.withOpacity(0.90),
                      const Color(0xFFF6FAFE),
                    ],
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                20,
                12,
                20,
                30,
              ),
              child: Column(
                children: [
                  // TOP BAR
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Not a client? ',
                            style: TextStyle(
                              color: Color(0xFF475467),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Switch',
                              style: TextStyle(
                                color: Color(0xFF0969C8),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // LOGO
                  _buildLogo(),

                  const SizedBox(height: 32),

                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Sign in to your client account',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF667085),
                    ),
                  ),

                  const SizedBox(height: 210),

                  // LOGIN CARD
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 25,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _inputField(
                          controller: emailController,
                          hint: 'Enter your email',
                          icon: Icons.email_outlined,
                          keyboardType:
                              TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _inputField(
                          controller: passwordController,
                          hint: 'Enter your password',
                          icon: Icons.lock_outline_rounded,
                          obscureText: obscurePassword,
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword =
                                    !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                            ),
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe =
                                          value ?? false;
                                    });
                                  },
                                  activeColor:
                                      const Color(0xFF0969C8),
                                ),
                                const Text('Remember me'),
                              ],
                            ),

                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Color(0xFF0969C8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 5),

                        _blueButton(
                          text: 'Sign In',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: () {
                            _login();
                          },
                        ),

                        const SizedBox(height: 22),

                        _orDivider(),

                        const SizedBox(height: 18),

                        _socialButton(
                          icon: Icons.g_mobiledata,
                          text: 'Continue with Google',
                        ),

                        const SizedBox(height: 12),

                        _socialButton(
                          icon: Icons.facebook_rounded,
                          text: 'Continue with Facebook',
                        ),

                        const SizedBox(height: 20),

                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Color(0xFF475467),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const ClientRegisterPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Create Account',
                                  style: TextStyle(
                                    color: Color(0xFF0969C8),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Verified Engineers     •     Detailed Reports     •     Safer Buildings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF667085),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Column(
      children: [
        Icon(
          Icons.apartment_rounded,
          size: 58,
          color: Color(0xFF0969C8),
        ),
        SizedBox(height: 5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Build',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172B4D),
                ),
              ),
              TextSpan(
                text: 'Sure',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0875D1),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Build with Confidence.',
          style: TextStyle(
            color: Color(0xFF667085),
          ),
        ),
      ],
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    Widget? suffix,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF667085),
        ),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFD0D5DD),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFFD0D5DD),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFF0969C8),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget _blueButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0969C8),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 12),
            Icon(icon),
          ],
        ),
      ),
    );
  }

  Widget _orDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'or continue with',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String text,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: const Color(0xFF0969C8),
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xFFD0D5DD),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Login authentication will be connected next.',
        ),
      ),
    );
  }
}