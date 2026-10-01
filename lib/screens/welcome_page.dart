import 'package:flutter/material.dart';
import 'client_login.dart';
import 'engineer_login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color primaryBlue = Color(0xFF0876D1);
  static const Color darkBlue = Color(0xFF102B52);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ------------------------------------------------------------
              // HEADER
              // ------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 22, 24, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.all(9),
                      child: Image.asset(
                        'assets/images/buildsure_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Build',
                                  style: TextStyle(
                                    color: darkBlue,
                                    fontSize: 31,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sure',
                                  style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 31,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Build with Confidence.',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------------------------------------------------
              // WELCOME BACKGROUND IMAGE
              // ------------------------------------------------------------
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 250,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/welcome_background.jpg',
                      fit: BoxFit.cover,
                    ),

                    // Soft white overlay for readable text
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.85),
                            Colors.white.withOpacity(0.18),
                            Colors.white.withOpacity(0.82),
                          ],
                        ),
                      ),
                    ),

                    const Positioned(
                      left: 28,
                      right: 28,
                      top: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Who are you?',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Choose your role to get started\nwith BuildSure.',
                            style: TextStyle(
                              fontSize: 19,
                              height: 1.35,
                              color: Color(0xFF596575),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ------------------------------------------------------------
              // ROLE CARDS
              // ------------------------------------------------------------
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
                child: Column(
                  children: [
                    _RoleCard(
                      title: 'Client',
                      subtitle: 'Property owner or\nconstruction customer',
                      image: 'assets/images/client_image.jpg',
                      icon: Icons.person_outline,
                      features: const [
                        'Book inspections',
                        'View reports',
                        'Monitor your project',
                      ],
                      buttonText: 'I am a Client',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ClientLoginPage(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 22),

                    _RoleCard(
                      title: 'Engineer',
                      subtitle: 'Civil/structural engineering\nprofessional',
                      image: 'assets/images/engineer_image.jpg',
                      icon: Icons.engineering_outlined,
                      features: const [
                        'Manage site visits',
                        'Create inspection reports',
                        'Track your projects',
                      ],
                      buttonText: 'I am an Engineer',
                      onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (_) => const EngineerLoginPage(),
                        ),
                       );
                      },
                    ),
                  ],
                ),
              ),

              // ------------------------------------------------------------
              // FOOTER
              // ------------------------------------------------------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 20,
                ),
                color: const Color(0xFFF5F9FD),
                child: const Text(
                  'Safe Buildings. Stronger Communities.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF596575),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================================================
// ROLE CARD
// ==========================================================================

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final IconData icon;
  final List<String> features;
  final String buttonText;
  final VoidCallback onPressed;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.icon,
    required this.features,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          SizedBox(
            height: 190,
            width: double.infinity,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    color: Color(0xFF667085),
                  ),
                ),

                const SizedBox(height: 16),

                ...features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Icon(
                          _featureIcon(feature),
                          size: 23,
                          color: const Color(0xFF344054),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF475467),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0876D1),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.arrow_forward, size: 22),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _featureIcon(String feature) {
    if (feature.contains('inspection') ||
        feature.contains('site')) {
      return Icons.home_work_outlined;
    }

    if (feature.contains('report')) {
      return Icons.description_outlined;
    }

    if (feature.contains('project')) {
      return Icons.verified_outlined;
    }

    return Icons.check_circle_outline;
  }
}