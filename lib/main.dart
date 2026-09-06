import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

// ==========================================
// APP ROOT with MaterialApp & Named Routes
// ==========================================
class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malyala Sahithi Purna - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.parchment,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}

// ==========================================
// COLOR THEME — Warm Paper & Raw Sienna
// ==========================================
class AppColors {
  static const parchment = Color(0xFFF5F0E8); // page background
  static const card = Color(0xFFEDE6D6);       // card / surface
  static const ink = Color(0xFF1C1410);         // primary text & buttons
  static const sienna = Color(0xFFC4621A);      // accent — headings, active, tags
  static const citrine = Color(0xFFD4A55A);     // secondary accent — stats, highlights
  static const muted = Color(0xFF6B5B4E);       // body text / subtext
  static const border = Color(0xFFD6CFC4);      // dividers and borders
  static const pillBg = Color(0xFFE6DDD0);      // skill pill background
  static const pillText = Color(0xFF5C3D1E);    // skill pill text
}

// ==========================================
// SHARED TOP NAVBAR
// ==========================================
class PortfolioNavBar extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.ink,
      elevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // Decorative name — left side
            const Text(
              'Malyala Sahithi Purna',
              style: TextStyle(
                color: Color(0xFFF5F0E8),
                fontSize: 15,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
            const Spacer(),
            // Nav links — right side
            _NavLink(label: 'Home', route: '/'),
            const SizedBox(width: 20),
            _NavLink(label: 'About', route: '/about'),
            const SizedBox(width: 20),
            _NavLink(label: 'Projects', route: '/projects'),
            const SizedBox(width: 20),
            _NavLink(label: 'Contact', route: '/contact'),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String route;

  const _NavLink({required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final currentRoute = ModalRoute.of(context)?.settings.name;
        if (currentRoute == route) return;
        if (route == '/') {
          Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF9A8880),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ==========================================
// BACK TO HOME BUTTON — reusable
// ==========================================
class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back, size: 16),
      label: const Text('Back to Home'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.ink,
        foregroundColor: AppColors.parchment,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ==========================================
// HOME PAGE
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      backgroundColor: AppColors.parchment,
      appBar: const PortfolioNavBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: _buildHeroText(context),
                        ),
                        const SizedBox(width: 40),
                        _buildProfileCard(),
                      ],
                    )
                  : Column(
                      children: [
                        _buildProfileCard(),
                        const SizedBox(height: 32),
                        _buildHeroText(context),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Eyebrow tag
        const Text(
          'DATA SCIENCE · AI/ML · CRYPTANALYSIS',
          style: TextStyle(
            color: AppColors.sienna,
            fontSize: 11,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        // Headline — ink + sienna two-line
        const Text(
          'Finding Patterns',
          style: TextStyle(
            color: AppColors.ink,
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const Text(
          'Others Miss.',
          style: TextStyle(
            color: AppColors.sienna,
            fontSize: 40,
            fontWeight: FontWeight.w800,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 20),
        // Bio
        const Text(
          '3rd-year B.Tech student at CRRao AIMSCS, Hyderabad — exploring machine learning, statistical modelling and cryptographic systems. Turning curiosity into code, one dataset at a time.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 14,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 32),
        // CTA Buttons — About Me (ink fill) + Projects (sienna fill) + Contact (ghost)
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/about'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.ink,
                foregroundColor: AppColors.parchment,
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'About Me',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/projects'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.sienna,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Projects',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, '/contact'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.muted,
                side: const BorderSide(color: AppColors.border),
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Contact',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CircleAvatar with AssetImage
          const CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.ink,
            backgroundImage: AssetImage('assets/picture/pic.jpeg'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Malyala Sahithi Purna',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'B.Tech Student · CRRao AIMSCS',
            style: TextStyle(
              color: AppColors.sienna,
              fontSize: 11,
              letterSpacing: 0.8,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          // Divider
          const Divider(color: AppColors.border, height: 1),
          const SizedBox(height: 16),
          // Stats row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStat('3rd', 'Year', isAccent: false),
              const SizedBox(width: 4),
              Container(width: 1, height: 32, color: AppColors.border),
              const SizedBox(width: 4),
              _buildStat('3+', 'Projects', isAccent: true),
              const SizedBox(width: 4),
              Container(width: 1, height: 32, color: AppColors.border),
              const SizedBox(width: 4),
              _buildStat('3', 'Domains', isAccent: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, {required bool isAccent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: isAccent ? AppColors.sienna : AppColors.ink,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 10,
              letterSpacing: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ABOUT PAGE
// ==========================================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchment,
      appBar: const PortfolioNavBar(),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---- Header band with avatar breaking out ----
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Dark ink band
                    Container(
                      width: double.infinity,
                      height: 140,
                      color: AppColors.ink,
                    ),
                    // Avatar breaks out of band at bottom
                    Positioned(
                      bottom: -44,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.sienna,
                            width: 3,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 44,
                          backgroundColor: AppColors.ink,
                          backgroundImage: AssetImage('assets/picture/pic.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                // Space for avatar overflow
                const SizedBox(height: 60),

                // ---- Tagline ----
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        'Student',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Builder',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Pattern Hunter',
                        style: TextStyle(
                          color: AppColors.sienna,
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Passionate about finding signal in noise — whether it is a neural network learning from data or a frequency attack revealing a hidden cipher key.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                          height: 1.65,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 36),

                // ---- Body content ----
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel('BACKGROUND'),
                      const SizedBox(height: 12),
                      const Text(
                        'Who am I?',
                        style: TextStyle(
                          color: AppColors.ink,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'I am a 3rd-year B.Tech student at CRRao AIMSCS, Hyderabad, with a growing interest in data science, artificial intelligence, and the mathematical side of cryptographic systems.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'I enjoy building projects that go beyond coursework — exploring real datasets, training models. I believe in learning by doing and communicating complex ideas simply.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 32),

                      _buildSectionLabel('SKILLS & TOOLS'),
                      const SizedBox(height: 16),

                      _buildSkillPanel(
                        title: 'Core Languages',
                        skills: ['Python', 'R', 'SQL', 'C'],
                        highlightFirst: true,
                      ),
                      const SizedBox(height: 10),
                      _buildSkillPanel(
                        title: 'AI / ML',
                        skills: ['scikit-learn', 'TensorFlow', 'PyTorch', 'NumPy', 'Pandas'],
                      ),
                      const SizedBox(height: 10),
                      _buildSkillPanel(
                        title: 'Data & Visualisation',
                        skills: ['Matplotlib', 'Seaborn', 'Plotly', 'Jupyter'],
                      ),
                      const SizedBox(height: 10),
                      _buildSkillPanel(
                        title: 'Tools',
                        skills: ['Git', 'VS Code', 'Google Colab', 'Linux'],
                      ),

                      const SizedBox(height: 40),

                      // Back to Home
                      const Center(child: BackToHomeButton()),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.sienna,
            fontSize: 11,
            letterSpacing: 2.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 0.5,
            color: AppColors.border,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillPanel({
    required String title,
    required List<String> skills,
    bool highlightFirst = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.asMap().entries.map((entry) {
              final isFirst = entry.key == 0 && highlightFirst;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: isFirst ? AppColors.ink : AppColors.pillBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: isFirst ? AppColors.parchment : AppColors.pillText,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// PROJECTS PAGE
// ==========================================
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchment,
      appBar: const PortfolioNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // ---- Header ----
                  const Text(
                    'MY WORK',
                    style: TextStyle(
                      color: AppColors.sienna,
                      fontSize: 11,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Selected Projects',
                    style: TextStyle(
                      color: AppColors.ink,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'A curated set of learning and engineering projects.',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // ---- Project cards — responsive ----
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 720;
                      if (isWide) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildProjectCard(
                              number: '01',
                              title: 'Weapon Segmentation',
                              description:
                                  'Real-time detection and segmentation of firearms and bladed weapons in images and videos. Generates segmentation masks, bounding boxes, and confidence scores for surveillance applications.',
                              tags: ['Python', 'scikit-learn', 'OpenCV', 'DeepLearning'],
                            )),
                            const SizedBox(width: 14),
                            Expanded(child: _buildProjectCard(
                              number: '02',
                              title: 'HAR Classification',
                              description:
                                  'Benchmark of 14 classifiers and 6 dimensionality reduction methods on the UCI HAR dataset. All 84 combinations evaluated on F1, ROC-AUC, and Cohen\'s Kappa.',
                              tags: ['Supervised Learning', 'Dimensionality Reduction'],
                            )),
                            const SizedBox(width: 14),
                            Expanded(child: _buildProjectCard(
                              number: '03',
                              title: 'Adversarial ML',
                              description:
                                  'Applying UAP on image datasets and making systems adversary-proof by training models on adversarial images. Currently in progress.',
                              tags: ['PyTorch'],
                            )),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          _buildProjectCard(
                            number: '01',
                            title: 'Weapon Segmentation',
                            description:
                                'Real-time detection and segmentation of firearms and bladed weapons in images and videos. Generates segmentation masks, bounding boxes, and confidence scores.',
                            tags: ['Python', 'scikit-learn', 'OpenCV', 'DeepLearning'],
                          ),
                          const SizedBox(height: 14),
                          _buildProjectCard(
                            number: '02',
                            title: 'HAR Classification',
                            description:
                                'Benchmark of 14 classifiers and 6 dimensionality reduction methods on the UCI HAR dataset. All 84 combinations evaluated on F1, ROC-AUC, and Cohen\'s Kappa.',
                            tags: ['Supervised Learning', 'Dimensionality Reduction'],
                          ),
                          const SizedBox(height: 14),
                          _buildProjectCard(
                            number: '03',
                            title: 'Adversarial ML',
                            description:
                                'Applying UAP on image datasets and making systems adversary-proof by training models on adversarial images. Currently in progress.',
                            tags: ['PyTorch'],
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 36),
                  const Center(child: BackToHomeButton()),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required String number,
    required String title,
    required String description,
    required List<String> tags,
  }) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top accent strip + number
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: const BoxDecoration(
              color: AppColors.ink,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              border: Border(
                bottom: BorderSide(color: AppColors.sienna, width: 3),
              ),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: AppColors.sienna,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
          ),
          // Card body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.ink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: AppColors.parchment,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// CONTACT PAGE
// ==========================================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchment,
      appBar: const PortfolioNavBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),

                  // ---- Unified contact card ----
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Dark top section
                        Container(
                          padding: const EdgeInsets.all(28),
                          color: AppColors.ink,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'GET IN TOUCH',
                                style: TextStyle(
                                  color: AppColors.sienna,
                                  fontSize: 11,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Let us connect.',
                                style: TextStyle(
                                  color: AppColors.parchment,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Open to internship opportunities, project collaborations, and interesting conversations.',
                                style: TextStyle(
                                  color: Color(0xFF9A8880),
                                  fontSize: 13,
                                  height: 1.55,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Light bottom section
                        Container(
                          padding: const EdgeInsets.all(24),
                          color: AppColors.card,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildContactLink(
                                icon: Icons.email_outlined,
                                text: 'sahithipurna.malyala@gmail.com',
                                subtext: 'Preferred — fastest response',
                                url: 'mailto:sahithipurna.malyala@gmail.com',
                              ),
                              const Divider(color: AppColors.border, height: 20),
                              _buildContactLink(
                                icon: Icons.code_outlined,
                                text: 'github.com/sahithi-101',
                                subtext: 'Projects and code',
                                url: 'https://github.com/sahithi-101',
                              ),
                              const Divider(color: AppColors.border, height: 20),
                              _buildContactLink(
                                icon: Icons.business_outlined,
                                text: 'linkedin.com/in/sahithi-purna-malyala',
                                subtext: 'Professional profile',
                                url: 'https://linkedin.com/in/sahithi-purna-malyala',
                              ),
                              const SizedBox(height: 20),

                              // Resume button — fixed width centered
                              Center(
                                child: SizedBox(
                                  width: 300,
                                  child: ElevatedButton.icon(
                                    onPressed: () => launchUrl(
                                      Uri.parse(
                                          'https://sahithi-101.github.io/portfolio/assets/resume/resume.pdf'),
                                      mode: LaunchMode.externalApplication,
                                    ),
                                    icon: const Icon(Icons.download, size: 16),
                                    label: const Text('View / Download Resume'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.ink,
                                      foregroundColor: AppColors.parchment,
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      textStyle: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  const Center(child: BackToHomeButton()),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactLink({
    required IconData icon,
    required String text,
    required String subtext,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.pillBg,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, size: 18, color: AppColors.sienna),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.sienna,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtext,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 11,
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
}