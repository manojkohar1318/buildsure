import 'package:flutter/material.dart';

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({
    super.key,
    this.hasProjects = false,
  });

  final bool hasProjects;

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  static const Color primaryBlue = Color(0xFF0876D1);
  static const Color darkBlue = Color(0xFF102B52);
  static const Color greyText = Color(0xFF667085);

  late bool _hasProjects;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _hasProjects = widget.hasProjects;
  }

  // ================================================================
  // ADD PROJECT
  // ================================================================

  void _addProject() {
    setState(() {
      _hasProjects = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Project added successfully.'),
      ),
    );
  }

  // ================================================================
  // COMING SOON
  // ================================================================

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature will be connected next.'),
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
            // ============================================================
            // BACKGROUND IMAGE
            // ============================================================

            Positioned.fill(
              child: Image.asset(
                'assets/images/welcome_background.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // Soft white overlay
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.84),
              ),
            ),

            // ============================================================
            // MAIN CONTENT
            // ============================================================

            Column(
              children: [
                Expanded(
                  child: _selectedIndex == 0
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(
                            18,
                            12,
                            18,
                            105,
                          ),
                          child: _hasProjects
                              ? _buildProjectDashboard()
                              : _buildEmptyDashboard(),
                        )
                      : _buildPlaceholderPage(),
                ),
              ],
            ),

            // ============================================================
            // BOTTOM NAVIGATION
            // ============================================================

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildBottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }

  // ####################################################################
  // EMPTY DASHBOARD
  // ####################################################################

  Widget _buildEmptyDashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(
          subtitle: "Let's get your construction project started.",
        ),

        const SizedBox(height: 20),

        // ==============================================================
        // WELCOME CARD
        // ==============================================================

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.97),
            borderRadius: BorderRadius.circular(27),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 20,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --------------------------------------------------------
                // NO PROJECT BADGE
                // --------------------------------------------------------

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF4FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        size: 17,
                        color: primaryBlue,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'No Projects Yet',
                        style: TextStyle(
                          color: primaryBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                const Text(
                  'Welcome to',
                  style: TextStyle(
                    color: darkBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const Text(
                  'BuildSure!',
                  style: TextStyle(
                    color: primaryBlue,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Add your construction project to monitor '
                  'construction quality, book inspections, view '
                  'reports and keep all your building documents '
                  'in one place.',
                  style: TextStyle(
                    color: Color(0xFF596575),
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 18),

                // --------------------------------------------------------
                // CLIENT HOUSE IMAGE
                // --------------------------------------------------------

                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/project_house.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // --------------------------------------------------------
                // BUTTONS
                // --------------------------------------------------------

                Row(
                  children: [
                    Expanded(
                      child: _primaryButton(
                        text: 'Add Your Project',
                        icon: Icons.add_circle_outline,
                        onPressed: _addProject,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _outlineButton(
                        text: 'Join a Project',
                        icon: Icons.people_outline,
                        onPressed: () {
                          _showComingSoon('Join a Project');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 25),

        // ================================================================
        // WHAT YOU CAN DO
        // ================================================================

        const Text(
          'What you can do with BuildSure',
          style: TextStyle(
            color: darkBlue,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 14),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.55,
          children: [
            _featureCard(
              icon: Icons.calendar_month_outlined,
              iconColor: primaryBlue,
              iconBackground: const Color(0xFFE3F2FD),
              title: 'Book Inspections',
              description: 'Schedule professional site inspections.',
            ),
            _featureCard(
              icon: Icons.description_outlined,
              iconColor: const Color(0xFF6C35D8),
              iconBackground: const Color(0xFFF0E7FF),
              title: 'View Reports',
              description: 'Access detailed inspection reports.',
            ),
            _featureCard(
              icon: Icons.bar_chart_outlined,
              iconColor: const Color(0xFF20A05A),
              iconBackground: const Color(0xFFE4F8EC),
              title: 'Monitor Construction',
              description: 'Track progress and construction quality.',
            ),
            _featureCard(
              icon: Icons.folder_open_outlined,
              iconColor: const Color(0xFFF29922),
              iconBackground: const Color(0xFFFFF1DD),
              title: 'Building Passport',
              description: 'Keep documents and records in one place.',
            ),
          ],
        ),

        const SizedBox(height: 27),

        // ================================================================
        // HOW BUILDSURE WORKS
        // ================================================================

        Row(
          children: [
            const Expanded(
              child: Text(
                'How BuildSure Works',
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _showComingSoon('Learn More');
              },
              child: const Text(
                'Learn More →',
                style: TextStyle(
                  color: primaryBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        _buildHowItWorks(),

        const SizedBox(height: 20),

        // ================================================================
        // PROMOTIONAL BANNER IMAGE
        // ================================================================

        GestureDetector(
          onTap: () {
            _showComingSoon('BuildSure Services');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: SizedBox(
              width: double.infinity,
              height: 125,
              child: Image.asset(
                'assets/images/promotional_banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ####################################################################
  // PROJECT DASHBOARD
  // ####################################################################

  Widget _buildProjectDashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(
          subtitle: 'Manage your construction projects.',
        ),

        const SizedBox(height: 20),

        // ================================================================
        // PROJECT CARD
        // ================================================================

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.97),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 18,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------------------------------------------------------
                  // PROJECT HOUSE
                  // ------------------------------------------------------

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: 105,
                      height: 105,
                      child: Image.asset(
                        'assets/images/project_house.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sharma Residence',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        SizedBox(height: 7),

                        _StatusBadge(),

                        SizedBox(height: 7),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: greyText,
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Kathmandu, Nepal',
                                style: TextStyle(
                                  color: Color(0xFF596575),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ----------------------------------------------------------
              // PROGRESS
              // ----------------------------------------------------------

              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.68,
                        minHeight: 10,
                        backgroundColor: Color(0xFFDCEBFA),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(primaryBlue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '68%',
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ----------------------------------------------------------
              // DATES
              // ----------------------------------------------------------

              Row(
                children: [
                  Expanded(
                    child: _projectInfo(
                      'Start Date',
                      '15 Jun 2026',
                    ),
                  ),
                  Expanded(
                    child: _projectInfo(
                      'Expected Completion',
                      '20 Dec 2026',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ----------------------------------------------------------
              // ASSIGNED ENGINEER
              // ----------------------------------------------------------

              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                        'assets/images/engineer_photo.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assigned Engineer',
                          style: TextStyle(
                            color: Color(0xFF98A2B3),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Er. Raj Sharma',
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      _showComingSoon('Project Details');
                    },
                    child: const Text(
                      'View Project →',
                      style: TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // ================================================================
        // QUICK ACTIONS
        // ================================================================

        const Text(
          'Quick Actions',
          style: TextStyle(
            color: darkBlue,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 14),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.65,
          children: [
            _actionCard(
              icon: Icons.calendar_month_outlined,
              color: primaryBlue,
              title: 'Book Inspection',
              onTap: () {
                _showComingSoon('Book Inspection');
              },
            ),
            _actionCard(
              icon: Icons.description_outlined,
              color: const Color(0xFF5B2CC9),
              title: 'View Reports',
              onTap: () {
                _showComingSoon('View Reports');
              },
            ),
            _actionCard(
              icon: Icons.folder_open_outlined,
              color: const Color(0xFF20A05A),
              title: 'Documents',
              onTap: () {
                _showComingSoon('Documents');
              },
            ),
            _actionCard(
              icon: Icons.verified_user_outlined,
              color: const Color(0xFFF29922),
              title: 'Building Passport',
              onTap: () {
                _showComingSoon('Building Passport');
              },
            ),
          ],
        ),

        const SizedBox(height: 26),

        // ================================================================
        // UPCOMING INSPECTION
        // ================================================================

        const Text(
          'Upcoming Inspection',
          style: TextStyle(
            color: darkBlue,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 14),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.97),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              // ----------------------------------------------------------
              // SAME PROJECT HOUSE IMAGE
              // ----------------------------------------------------------

              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: SizedBox(
                  width: 82,
                  height: 100,
                  child: Image.asset(
                    'assets/images/project_house.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Structural Inspection',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 15,
                          color: greyText,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '12 Oct 2026',
                          style: TextStyle(
                            color: Color(0xFF475467),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          size: 15,
                          color: greyText,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '10:30 AM',
                          style: TextStyle(
                            color: Color(0xFF475467),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),

                    Row(
                      children: [
                        Icon(
                          Icons.engineering_outlined,
                          size: 15,
                          color: greyText,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Er. Raj Sharma',
                            style: TextStyle(
                              color: Color(0xFF475467),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0F7E9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Confirmed',
                      style: TextStyle(
                        color: Color(0xFF178548),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextButton(
                    onPressed: () {
                      _showComingSoon('Inspection Details');
                    },
                    child: const Text(
                      'Details →',
                      style: TextStyle(
                        color: primaryBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ####################################################################
  // HEADER
  // ####################################################################

  Widget _buildHeader({
    required String subtitle,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ------------------------------------------------------------
            // BUILDSURE LOGO
            // ------------------------------------------------------------

            SizedBox(
              width: 55,
              height: 55,
              child: Image.asset(
                'assets/images/buildsure_logo.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 9),

            const Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Build',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: 'Sure',
                      style: TextStyle(
                        color: primaryBlue,
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------------------------------------------------
            // NOTIFICATION
            // ------------------------------------------------------------

            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    _showComingSoon('Notifications');
                  },
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    color: darkBlue,
                    size: 29,
                  ),
                ),
                Positioned(
                  right: 9,
                  top: 7,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            // ------------------------------------------------------------
            // CLIENT PROFILE PHOTO
            // ------------------------------------------------------------
 GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
              child: ClipOval(
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: Image.asset(
                    'assets/images/client_photo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Good Morning, Manoj 👋',
            style: const TextStyle(
              color: darkBlue,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const SizedBox(height: 4),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subtitle,
            style: const TextStyle(
              color: greyText,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  // ####################################################################
  // HOW BUILDSURE WORKS
  // ####################################################################

  Widget _buildHowItWorks() {
    final steps = [
      {
        'number': '1',
        'icon': Icons.home_outlined,
        'title': 'Add Project',
        'description': 'Add your property details.',
        'color': primaryBlue,
        'background': const Color(0xFFE6F2FF),
      },
      {
        'number': '2',
        'icon': Icons.calendar_month_outlined,
        'title': 'Book Inspection',
        'description': 'Schedule the inspection you need.',
        'color': primaryBlue,
        'background': const Color(0xFFE6F2FF),
      },
      {
        'number': '3',
        'icon': Icons.engineering_outlined,
        'title': 'Engineer Visits',
        'description': 'Our engineer inspects your site.',
        'color': const Color(0xFF20A05A),
        'background': const Color(0xFFE3F8EB),
      },
      {
        'number': '4',
        'icon': Icons.description_outlined,
        'title': 'Get Report',
        'description': 'Receive detailed reports.',
        'color': const Color(0xFF6C35D8),
        'background': const Color(0xFFF0E7FF),
      },
    ];

    return SizedBox(
      height: 175,
      child: Row(
        children: List.generate(
          steps.length,
          (index) {
            final step = steps[index];

            return Expanded(
              child: Stack(
                children: [
                  if (index < steps.length - 1)
                    Positioned(
                      top: 43,
                      left: 56,
                      right: -8,
                      child: Row(
                        children: List.generate(
                          4,
                          (_) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              height: 2,
                              color: const Color(0xFFCBD5E1),
                            ),
                          ),
                        ),
                      ),
                    ),

                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 66,
                            height: 66,
                            decoration: BoxDecoration(
                              color: step['background'] as Color,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              step['icon'] as IconData,
                              color: step['color'] as Color,
                              size: 31,
                            ),
                          ),

                          Positioned(
                            left: -2,
                            top: -10,
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: const BoxDecoration(
                                color: primaryBlue,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                step['number'] as String,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Text(
                        step['title'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: darkBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        child: Text(
                          step['description'] as String,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: greyText,
                            fontSize: 10,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ####################################################################
  // FEATURE CARD
  // ####################################################################

  Widget _featureCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.97),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 26,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: greyText,
                    fontSize: 10.5,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ####################################################################
  // QUICK ACTION CARD
  // ####################################################################

  Widget _actionCard({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white.withOpacity(0.97),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),

              const SizedBox(width: 11),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: darkBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ####################################################################
  // PROJECT INFO
  // ####################################################################

  Widget _projectInfo(
    String title,
    String value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF98A2B3),
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: darkBlue,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // ####################################################################
  // PRIMARY BUTTON
  // ####################################################################

  Widget _primaryButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Icon(
                icon,
                size: 21,
              ),
              const SizedBox(width: 7),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ####################################################################
  // OUTLINE BUTTON
  // ####################################################################

  Widget _outlineButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 54,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlue,
          side: const BorderSide(
            color: primaryBlue,
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              Icon(
                icon,
                size: 21,
              ),
              const SizedBox(width: 6),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.arrow_forward,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ####################################################################
  // BOTTOM NAVIGATION
  // ####################################################################

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.98),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            children: [
              _navItem(
                index: 0,
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Home',
              ),

              _navItem(
                index: 1,
                icon: Icons.description_outlined,
                activeIcon: Icons.description,
                label: 'Projects',
              ),

              // ----------------------------------------------------------
              // CENTER BOOK BUTTON
              // ----------------------------------------------------------

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _showComingSoon('Book Inspection');
                  },
                  child: Transform.translate(
                    offset: const Offset(0, -17),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: primaryBlue,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: primaryBlue.withOpacity(0.30),
                                blurRadius: 12,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),

                        const SizedBox(height: 1),

                        const Text(
                          'Book',
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              _navItem(
                index: 3,
                icon: Icons.description_outlined,
                activeIcon: Icons.description,
                label: 'Reports',
              ),

              _navItem(
                index: 4,
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ####################################################################
  // NAV ITEM
  // ####################################################################

  Widget _navItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final bool selected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? activeIcon : icon,
              color: selected
                  ? primaryBlue
                  : greyText,
              size: 25,
            ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                color: selected
                    ? primaryBlue
                    : greyText,
                fontSize: 11,
                fontWeight: selected
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ####################################################################
  // PLACEHOLDER PAGES
  // ####################################################################

  Widget _buildPlaceholderPage() {
    String title;

    switch (_selectedIndex) {
      case 1:
        title = 'Projects';
        break;

      case 3:
        title = 'Reports';
        break;

      case 4:
        title = 'Profile';
        break;

      default:
        title = 'BuildSure';
    }

    return Center(
      child: Text(
        '$title\nComing Soon',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: darkBlue,
          fontSize: 25,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

// ##########################################################################
// STATUS BADGE
// ##########################################################################

class _StatusBadge extends StatelessWidget {
  const _StatusBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9B8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Under Construction',
        style: TextStyle(
          color: Color(0xFFD97904),
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}