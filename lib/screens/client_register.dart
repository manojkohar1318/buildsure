import 'package:flutter/material.dart';

class ClientRegisterPage extends StatefulWidget {
  const ClientRegisterPage({super.key});

  @override
  State<ClientRegisterPage> createState() =>
      _ClientRegisterPageState();
}

class _ClientRegisterPageState
    extends State<ClientRegisterPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
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
            // Background
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
                      Colors.white.withOpacity(0.92),
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
                            'Already have an account? ',
                            style: TextStyle(
                              color: Color(0xFF475467),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
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

                  const SizedBox(height: 22),

                  // LOGO
                  _buildLogo(),

                  const SizedBox(height: 28),

                  const Text(
                    'Create Your Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Join as a client and start your construction\n'
                    'journey with BuildSure.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: Color(0xFF667085),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // CLIENT INFORMATION BOX
                  Container(
                    padding: const EdgeInsets.all(17),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF4FF),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFD4E9FF),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0969C8),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),

                        const SizedBox(width: 14),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You are creating a Client account',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'As a client, you can book inspections, '
                                'view reports, and manage your projects.',
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.35,
                                  color: Color(0xFF475467),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FORM CARD
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
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
                          'Full Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _inputField(
                          controller: nameController,
                          hint: 'Enter your full name',
                          icon: Icons.person_outline_rounded,
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Mobile Number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _inputField(
                          controller: mobileController,
                          hint: 'Enter your mobile number',
                          icon: Icons.phone_outlined,
                          keyboardType:
                              TextInputType.phone,
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
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

                        const SizedBox(height: 16),

                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 8),

                        _inputField(
                          controller: passwordController,
                          hint: 'Create a password',
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

                        const SizedBox(height: 10),

                        _passwordRule(
                          'At least 8 characters',
                          passwordController.text.length >=
                              8,
                        ),

                        _passwordRule(
                          'Include a number',
                          RegExp(r'[0-9]').hasMatch(
                            passwordController.text,
                          ),
                        ),

                        _passwordRule(
                          'Include a letter',
                          RegExp(r'[A-Za-z]').hasMatch(
                            passwordController.text,
                          ),
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _createAccount,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF0969C8),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(14),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                        FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

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

                        const Text.rich(
                          TextSpan(
                            text:
                                'By creating an account, you agree to our ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF667085),
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Color(0xFF0969C8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Color(0xFF0969C8),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(text: '.'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
          size: 55,
          color: Color(0xFF0969C8),
        ),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Build',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF172B4D),
                ),
              ),
              TextSpan(
                text: 'Sure',
                style: TextStyle(
                  fontSize: 30,
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
            fontSize: 14,
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
      onChanged: (_) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF667085),
        ),
        suffixIcon: suffix,
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

  Widget _passwordRule(
    String text,
    bool valid,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            valid
                ? Icons.check_circle
                : Icons.check_circle_outline,
            size: 18,
            color: valid
                ? const Color(0xFF4CAF50)
                : const Color(0xFF98A2B3),
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF667085),
            ),
          ),
        ],
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
            'or sign up with',
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

  void _createAccount() {
    final name = nameController.text.trim();
    final mobile = mobileController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (name.isEmpty ||
        mobile.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please complete all fields.',
          ),
        ),
      );
      return;
    }

    if (password.length < 8 ||
        !RegExp(r'[0-9]').hasMatch(password) ||
        !RegExp(r'[A-Za-z]').hasMatch(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please create a stronger password.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Account authentication will be connected next.',
        ),
      ),
    );
  }
}