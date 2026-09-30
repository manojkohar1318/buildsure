import 'package:flutter/material.dart';
import 'client_login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const Color primaryBlue = Color(0xFF0969C8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FD),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1541888946425-d81bb19240f5'
              '?auto=format&fit=crop&w=1200&q=80',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFEAF3FB),
                );
              },
            ),
          ),

          // White overlay
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.90),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // Logo
                  _buildLogo(),

                  const SizedBox(height: 35),

                  const Text(
                    'Who are you?',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Choose your role to get started\nwith BuildSure.',
                    style: TextStyle(
                      fontSize: 19,
                      height: 1.4,
                      color: Color(0xFF667085),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // CLIENT CARD
                  _roleCard(
                    context: context,
                    title: 'Client',
                    subtitle:
                        'Property owner or\nconstruction customer',
                    icon: Icons.person_outline_rounded,
                    imageUrl:
                        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c'
                        '?auto=format&fit=crop&w=900&q=80',
                    features: const [
                      'Book inspections',
                      'View reports',
                      'Monitor your project',
                    ],
                    featureIcons: const [
                      Icons.home_outlined,
                      Icons.description_outlined,
                      Icons.verified_user_outlined,
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

                  // ENGINEER CARD
                  _roleCard(
                    context: context,
                    title: 'Engineer',
                    subtitle:
                        'Civil/structural engineering\nprofessional',
                    icon: Icons.engineering_outlined,
                    imageUrl:
                        'https://images.unsplash.com/photo-1503387762-592deb58ef4e'
                        '?auto=format&fit=crop&w=900&q=80',
                    features: const [
                      'Manage site visits',
                      'Create inspection reports',
                      'Track your projects',
                    ],
                    featureIcons: const [
                      Icons.calendar_month_outlined,
                      Icons.description_outlined,
                      Icons.bar_chart_outlined,
                    ],
                    buttonText: 'I am an Engineer',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Engineer section coming next.',
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  const Center(
                    child: Text(
                      'Safe Buildings. Stronger Communities.',
                      style: TextStyle(
                        color: Color(0xFF667085),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF3FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.apartment_rounded,
            color: Color(0xFF0969C8),
            size: 35,
          ),
        ),
        const SizedBox(width: 12),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Build',
                    style: TextStyle(
                      color: Color(0xFF172B4D),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'Sure',
                    style: TextStyle(
                      color: Color(0xFF0875D1),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
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
        ),
      ],
    );
  }

  Widget _roleCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required String imageUrl,
    required List<String> features,
    required List<IconData> featureIcons,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 185,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFEAF3FB),
                  child: Icon(
                    icon,
                    size: 70,
                    color: primaryBlue,
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    color: Color(0xFF667085),
                  ),
                ),

                const SizedBox(height: 18),

                for (int i = 0; i < features.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Icon(
                          featureIcons[i],
                          size: 23,
                          color: const Color(0xFF344054),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          features[i],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF475467),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 7),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
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
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward_rounded),
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
}