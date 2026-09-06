import 'package:flutter/material.dart';

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
        scaffoldBackgroundColor: AppColors.white,
      ),
      // Named Routes as per requirement
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
        '/contact': (context) => const ContactPage(), // Bonus
      },
    );
  }
}

// ==========================================
// COLOR THEME (from HTML design)
// ==========================================
class AppColors {
  static const navy = Color(0xFF0B1F3A);
  static const navyMid = Color(0xFF163055);
  static const navyLight = Color(0xFF1E4070);
  static const gold = Color(0xFFC9A84C);
  static const goldLight = Color(0xFFE2C97E);
  static const white = Color(0xFFF8F9FB);
  static const offWhite = Color(0xFFEDF0F5);
  static const muted = Color(0xFF8A9BB5);
  static const text = Color(0xFF1A2A40);
}

// ==========================================
// HOME PAGE
// ==========================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive check using MediaQuery
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Stack(
        children: [
          // Decorative background circles (demonstrates Stack)
          Positioned(
            right: -80,
            top: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gold.withValues(alpha: 0.04),
              ),
            ),
          ),
          Positioned(
            left: -60,
            bottom: 100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gold.withValues(alpha: 0.03),
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: isWide
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildProfileInfo(context),
                      ),
                      const SizedBox(width: 48),
                      _buildAvatarCard(),
                    ],
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAvatarCard(),
                      const SizedBox(height: 32),
                      _buildProfileInfo(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile Card with CircleAvatar (NetworkImage)
  Widget _buildAvatarCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CircleAvatar with NetworkImage as required
          const CircleAvatar(
            radius: 70,
            backgroundColor: AppColors.navyLight,
            backgroundImage: NetworkImage('https://github.com/sahithi-101/Portfolio_App/blob/d1ed0b0b39d1aae76d6b098e4622ed991719246b/pic.jpeg'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Malyala Sahithi Purna',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'B.Tech Student · CRRao AIMSCS',
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 12,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // Stats Row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStat('3rd', 'Year'),
              const SizedBox(width: 28),
              _buildStat('3+', 'Projects'),
              const SizedBox(width: 28),
              _buildStat('3', 'Domains'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: AppColors.goldLight,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.muted,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  // Name, Designation, Buttons arranged in Column
  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tagline
        const Text(
          'Data Science · AI/ML · Cryptanalysis',
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 12,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        // Name with styling
        const Text(
          'Finding Patterns',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const Text(
          'Others Miss.',
          style: TextStyle(
            color: AppColors.goldLight,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 20),
        // Bio
        const Text(
          '3rd-year B.Tech student at CRRao AIMSCS, Hyderabad - exploring machine learning, statistical modelling. Turning curiosity into code, one dataset at a time.',
          style: TextStyle(
            color: AppColors.muted,
            fontSize: 15,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        // Buttons Row
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            // About Me Button
            ElevatedButton(
              onPressed: () {
                // Navigate to AboutPage using named route
                Navigator.pushNamed(context, '/about');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                foregroundColor: AppColors.navy,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'About Me',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            // Projects Button
            ElevatedButton(
              onPressed: () {
                // Navigate to ProjectsPage using named route
                Navigator.pushNamed(context, '/projects');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                elevation: 0,
                side: const BorderSide(color: Colors.white38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Projects',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            // Bonus: Contact Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                elevation: 0,
                side: const BorderSide(color: Colors.white24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                'Contact',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ],
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.white,
        title: const Text('About Me'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Hero Section with Image widget (demonstrates Image from syllabus)
                Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                // Explicit Image widget usage
                ClipOval(
                child: Image.asset(
                'https://github.com/sahithi-101/Portfolio_App/blob/d1ed0b0b39d1aae76d6b098e4622ed991719246b/pic.jpeg',
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Student. Builder. Pattern Hunter.',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Passionate about finding signal in noise - whether it is a neural network learning from data or a frequency attack revealing a hidden cipher key. Currently in my 3rd year of B.Tech at CRRao AIMSCS, Hyderabad, building skills at the intersection of math and code.',
                  style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 14,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Background Section
        _buildSectionHeader('Background'),
        const SizedBox(height: 12),
        const Text(
          'Who am I?',
          style: TextStyle(
            color: AppColors.navy,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
            'I am a 3rd-year B.Tech student at CRRao AIMSCS, Hyderabad, with a growing interest in data science, artificial intelligence, and the mathematical side of cryptographic systems.',
            style: TextStyle(
            color: Color(0xFF4A5A70),
        fontSize: 14,
        height: 1.7,
      ),
    ),
    const SizedBox(height: 12),
    const Text(
    'I enjoy building projects that go beyond coursework - exploring real datasets, training models. I believe in learning by doing and communicating complex ideas simply.',
    style: TextStyle(
    color: Color(0xFF4A5A70),
    fontSize: 14,
    height: 1.7,
    ),
    ),
    const SizedBox(height: 32),
    // Skills Section
    _buildSectionHeader('Skills & Tools'),
    const SizedBox(height: 16),
    _buildSkillPanel(
    title: 'Core Languages',
    skills: ['Python', 'R', 'SQL', 'C'],
    highlightFirst: true,
    ),
    const SizedBox(height: 12),
    _buildSkillPanel(
    title: 'AI / ML',
    skills: ['scikit-learn', 'TensorFlow', 'PyTorch', 'NumPy', 'Pandas'],
    ),
    const SizedBox(height: 12),
    _buildSkillPanel(
    title: 'Data & Visualisation',
    skills: ['Matplotlib', 'Seaborn', 'Plotly', 'Jupyter'],
    ),
    const SizedBox(height: 12),
    _buildSkillPanel(
    title: 'Tools',
    skills: ['Git', 'VS Code', 'Google Colab', 'Linux'],
    ),
    const SizedBox(height: 40),
    // Back to Home Button
    Center(
    child: ElevatedButton.icon(
    onPressed: () {
    // Navigate back using Navigator.pop
    Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back, size: 18),
    label: const Text('Back to Home'),
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.gold,
    foregroundColor: AppColors.navy,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    elevation: 0,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    ),
    ),
    ),
    ),
    const SizedBox(height: 24),
    ],
    ),
    ),
    ),
    ),
    ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.gold,
            fontSize: 12,
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.gold, Colors.transparent],
              ),
            ),
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
        color: AppColors.offWhite,
        border: Border.all(color: const Color(0xFFD8DDE8)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.navy,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.asMap().entries.map((entry) {
              final isHighlighted = entry.key == 0 && highlightFirst;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: isHighlighted ? const Color(0xFFFBF6E9) : AppColors.white,
                  border: Border.all(
                    color: isHighlighted ? AppColors.gold : const Color(0xFFC8D0DC),
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    color: isHighlighted ? const Color(0xFF7A5A10) : AppColors.navyLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.white,
        title: const Text('Projects'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: AppColors.navy,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'MY WORK',
                          style: TextStyle(
                            color: AppColors.gold,
                            fontSize: 12,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Selected Projects',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'A curated set of learning and engineering projects.',
                          style: TextStyle(
                            color: AppColors.muted,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Projects Grid - Responsive with MediaQuery/LayoutBuilder
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWide = constraints.maxWidth > 720;
                      if (isWide) {
                        // Row with Expanded for responsive width
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildProjectCard01()),
                            const SizedBox(width: 16),
                            Expanded(child: _buildProjectCard02()),
                            const SizedBox(width: 16),
                            Expanded(child: _buildProjectCard03()),
                          ],
                        );
                      }
                      // Column for narrow screens
                      return Column(
                        children: [
                          _buildProjectCard01(),
                          const SizedBox(height: 16),
                          _buildProjectCard02(),
                          const SizedBox(height: 16),
                          _buildProjectCard03(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  // Back to Home Button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, size: 18),
                      label: const Text('Back to Home'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gold,
                        foregroundColor: AppColors.navy,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Project 1: Weapon Segmentation
  Widget _buildProjectCard01() {
    return _buildProjectCard(
      number: '01',
      title: 'Weapon Segmentation',
      description: 'This project focuses on real-time detection and segmentation of weapons such as firearms and bladed weapons in images and videos. The system generates segmentation masks, bounding boxes, and confidence scores for detected weapons and is designed for surveillance and threat-detection applications.',
      tags: const ['Python', 'scikit-learn', 'OpenCV', 'DeepLearning'],
      gradient: const LinearGradient(
        colors: [Color(0xFF0B1F3A), Color(0xFF1E4070)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // Project 2: HAR Classification Benchmark
  Widget _buildProjectCard02() {
    return _buildProjectCard(
      number: '02',
      title: 'HAR Classification Benchmark',
      description: 'Systematic benchmark of 14 classifiers and 6 dimensionality reduction methods on the UCI HAR dataset. All 84 reducer-classifier combinations evaluated on F1, ROC-AUC, Cohens Kappa, and train time to find the best accuracy-efficiency tradeoff.',
      tags: const ['Supervised Learning', 'Dimentionality Reduction'],
      gradient: const LinearGradient(
        colors: [Color(0xFF0D2B1E), Color(0xFF1A5235)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // Project 3: Adversarial ML
  Widget _buildProjectCard03() {
    return _buildProjectCard(
      number: '03',
      title: 'Adversarial ML',
      description: 'Currently working on this project. Applying UAP on image dataset and making the system Adversary proof by training the model on adversarial images.',
      tags: const ['PyTorch'],
      gradient: const LinearGradient(
        colors: [Color(0xFF2A1A3A), Color(0xFF4A2066)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  // Reusable Card widget using Card and Container
  Widget _buildProjectCard({
    required String number,
    required String title,
    required String description,
    required List<String> tags,
    required Gradient gradient,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: Color(0xFFD8DDE8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner with gradient
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          // Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF5A6A80),
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 14),
                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.offWhite,
                      border: Border.all(color: const Color(0xFFC8D0DC)),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: AppColors.navyLight,
                        fontSize: 11,
                      ),
                    ),
                  )).toList(),
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
// CONTACT PAGE (BONUS)
// ==========================================
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        foregroundColor: AppColors.white,
        title: const Text('Contact'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  Text(
                    'GET IN TOUCH',
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 12,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Let us connect.',
                  style: TextStyle(
                  color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Open to internship opportunities, project collaborations, and interesting conversations. Fill in the form or reach out directly.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Contact Info Card
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: const BorderSide(color: Color(0xFFD8DDE8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Reach Me',
                      style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Always happy to talk. Whether you have a project idea, a question about my work, or just want to say hi — my inbox is open.',
                      style: TextStyle(
                        color: Color(0xFF4A5A70),
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildContactRow(Icons.email_outlined, 'sahithipurna.malyala@gmail.com'),
                    const SizedBox(height: 14),
                    _buildContactRow(Icons.code_outlined, 'github.com/sahithi-101'),
                    const SizedBox(height: 14),
                    _buildContactRow(Icons.business_outlined, 'linkedin.com/in/sahithi-purna-malyala'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Back to Home Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Back to Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.navy,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
    ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            border: Border.all(color: const Color(0xFFC8D0DC)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, size: 20, color: AppColors.navyLight),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.navyLight,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}