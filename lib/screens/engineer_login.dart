import 'package:flutter/material.dart';

class EngineerLoginPage extends StatefulWidget {
  const EngineerLoginPage({super.key});

  @override
  State<EngineerLoginPage> createState() => _EngineerLoginPageState();
}

class _EngineerLoginPageState extends State<EngineerLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = true;

  static const Color primaryBlue = Color(0xFF0876D1);
  static const Color darkBlue = Color(0xFF102B52);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your Employee ID, email/mobile number and password.',
          ),
        ),
      );
      return;
    }

    // Firebase/organisation authentication will be connected later.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Engineer authentication will be connected next.',
        ),
      ),
    );
  }

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Password recovery will be connected with the organisation system.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FD),
      body: SafeArea(
        child: Stack(
          children: [
            // ==============================================================
            // BACKGROUND IMAGE
            // ==============================================================

            Positioned.fill(
              child: Image.asset(
                'assets/images/welcome_background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // ==============================================================
            // BACKGROUND OVERLAY
            // ==============================================================

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.88),
                      Colors.white.withOpacity(0.48),
                      Colors.white.withOpacity(0.92),
                    ],
                    stops: const [
                      0.0,
                      0.48,
                      1.0,
                    ],
                  ),
                ),
              ),
            ),

            // ==============================================================
            // CONTENT
            // ==============================================================

            SingleChildScrollView(
              child: Column(
                children: [
                  // --------------------------------------------------------
                  // TOP BAR
                  // --------------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      14,
                      10,
                      18,
                      0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.90),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 20,
                              color: darkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --------------------------------------------------------
                  // BUILDSURE LOGO
                  // --------------------------------------------------------

                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      25,
                      18,
                      25,
                      0,
                    ),
                    child: Column(
                      children: [
                        // If buildsure_logo.png contains the complete
                        // BuildSure logo + tagline, use it directly.
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.88),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image.asset(
                            'assets/images/buildsure_logo.png',
                            height: 72,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --------------------------------------------------------
                  // ENGINEER LOGIN TITLE
                  // --------------------------------------------------------

                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      28,
                      24,
                      28,
                      18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Engineer Login',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 38,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Access your engineer account to manage '
                          'site visits, reports and projects.',
                          style: TextStyle(
                            color: Color(0xFF596575),
                            fontSize: 17,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --------------------------------------------------------
                  // LOGIN CARD
                  // --------------------------------------------------------

                  Container(
                    margin: const EdgeInsets.fromLTRB(
                      20,
                      8,
                      20,
                      30,
                    ),
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      22,
                      20,
                      28,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.97),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --------------------------------------------------
                        // ENGINEER ACCESS INFORMATION
                        // --------------------------------------------------

                        Container(
                          padding: const EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF4FF),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFD4E8FA),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  color: primaryBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.engineering_outlined,
                                  color: Colors.white,
                                  size: 29,
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Engineer Access Only',
                                      style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Use the Employee ID, registered '
                                      'email or registered mobile number '
                                      'provided by your organisation.',
                                      style: TextStyle(
                                        color: Color(0xFF596575),
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // --------------------------------------------------
                        // USERNAME
                        // --------------------------------------------------

                        const Text(
                          'Employee ID / Email / Mobile Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1D2939),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText:
                                'Enter Employee ID, Email or Mobile',
                            hintStyle: const TextStyle(
                              color: Color(0xFF98A2B3),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xFF667085),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: primaryBlue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // --------------------------------------------------
                        // PASSWORD
                        // --------------------------------------------------

                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1D2939),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) => _login(),
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(
                              color: Color(0xFF98A2B3),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF667085),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword =
                                      !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF667085),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Color(0xFFD0D5DD),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: primaryBlue,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // --------------------------------------------------
                        // REMEMBER + FORGOT
                        // --------------------------------------------------

                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              activeColor: primaryBlue,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF475467),
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: _forgotPassword,
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: primaryBlue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // --------------------------------------------------
                        // LOGIN BUTTON
                        // --------------------------------------------------

                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryBlue,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 23,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // --------------------------------------------------
                        // SECURITY MESSAGE
                        // --------------------------------------------------

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F9FD),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.verified_user_outlined,
                                color: primaryBlue,
                                size: 21,
                              ),
                              SizedBox(width: 9),
                              Expanded(
                                child: Text(
                                  'Engineer accounts are created and '
                                  'managed by the organisation. '
                                  'Registration is not available here.',
                                  style: TextStyle(
                                    color: Color(0xFF667085),
                                    fontSize: 12.5,
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

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}