import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final ScrollController _scrollController = ScrollController();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  bool _isDarkMode = true;

  Future<void> _launchWeb(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchWhatsApp(String number) async {
    final Uri uri = Uri.parse('https://wa.me/$number');
    if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
      throw Exception('Could not open WhatsApp');
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(uri)) {
      throw Exception('Could not open Email app');
    }
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final lightTextColor = Colors.black;
    final lightSubTextColor = Colors.grey[800];
    final darkTextColor = Colors.white;
    final darkSubTextColor = Colors.grey[400];

    return MaterialApp(
      title: 'Tarek Ali | Portfolio',
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE8F1FF),
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E14),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              TextButton(
                onPressed: () => _scrollToSection(aboutKey),
                child: Text('About',
                    style: TextStyle(
                        color: _isDarkMode ? darkTextColor : lightTextColor)),
              ),
              TextButton(
                onPressed: () => _scrollToSection(skillsKey),
                child: Text('Technical Skills',
                    style: TextStyle(
                        color: _isDarkMode ? darkTextColor : lightTextColor)),
              ),
              TextButton(
                onPressed: () => _scrollToSection(projectsKey),
                child: Text('Projects',
                    style: TextStyle(
                        color: _isDarkMode ? darkTextColor : lightTextColor)),
              ),
              TextButton(
                onPressed: () => _scrollToSection(contactKey),
                child: Text('Contact',
                    style: TextStyle(
                        color: _isDarkMode ? darkTextColor : lightTextColor)),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: () {
                setState(() => _isDarkMode = !_isDarkMode);
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/tarek.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Tarek Ali',
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color:
                          _isDarkMode ? Colors.cyanAccent : Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Flutter Developer',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: _isDarkMode ? darkSubTextColor : lightSubTextColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.github),
                        color: _isDarkMode ? Colors.white : Colors.black,
                        onPressed: () =>
                            _launchWeb('https://github.com/Tarekali2027'),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.linkedin),
                        color: const Color(0xFF5090FF),
                        onPressed: () => _launchWeb(
                            'https://www.linkedin.com/in/tarek-ahmed-1040432a4/'),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.whatsapp),
                        color: Colors.green,
                        onPressed: () => _launchWhatsApp('201064480857'),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.solidEnvelope),
                        color: Colors.redAccent,
                        onPressed: () => _launchEmail('alit53125@gmail.com'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),

                  // About Section
                  Container(
                    key: aboutKey,
                    child: Column(
                      children: [
                        Text(
                          'About Me',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _isDarkMode
                                ? Colors.cyanAccent
                                : Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "I'm a passionate Flutter developer focused on building responsive, elegant, and high-performance apps.\n"
                          "I love turning complex problems into simple, beautiful solutions.\n\n"
                          "My goal is to become a full-stack mobile developer and create impactful digital experiences.",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: _isDarkMode
                                ? darkSubTextColor
                                : lightSubTextColor,
                            height: 1.6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),

                  // Skills Section
                  Container(
                    key: skillsKey,
                    child: Column(
                      children: [
                        Text(
                          'Technical Skills',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _isDarkMode
                                ? const Color.fromARGB(255, 24, 249, 249)
                                : const Color.fromARGB(255, 68, 135, 251),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildSkillCard('Flutter', 0.85),
                            _buildSkillCard('Dart', 0.80),
                            _buildSkillCard('Firebase', 0.75),
                            _buildSkillCard('REST APIs', 0.70),
                            _buildSkillCard('Git & GitHub', 0.80),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),

                  // Projects Section
                  Container(
                    key: projectsKey,
                    child: Column(
                      children: [
                        Text(
                          'My Projects',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _isDarkMode
                                ? Colors.cyanAccent
                                : Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildProjectCard(
                              'Basketball Counter',
                              'A simple Flutter app to track basketball scores for two teams with real-time updates.',
                              'Flutter, Dart, Stateful Widgets',
                              'assets/images/WhatsApp-Image-2025-10-04-at-16.49.28327dfc36.jpg',
                              'https://github.com/Tarekali2027',
                            ),
                            _buildProjectCard(
                              'German Learner',
                              'An interactive German learning app with vocabulary, quizzes, and pronunciation support.',
                              'Flutter, Firebase, TTS',
                              'assets/images/WhatsApp-Image-2025-10-04-at-16.49.5570ed3848.jpg',
                              'https://github.com/Tarekali2027',
                            ),
                            _buildProjectCard(
                              'Sakina App',
                              'An app showing Quranic verses based on mood for peace and comfort.',
                              'Flutter, Dart, Local JSON',
                              'assets/images/WhatsApp-Image-2025-10-04-at-16.47.211bc42659.jpg',
                              'https://github.com/Tarekali2027',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),

                  // Contact Section
                  Container(
                    key: contactKey,
                    child: Column(
                      children: [
                        Text(
                          'Find Me Online',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _isDarkMode
                                ? Colors.cyanAccent
                                : Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.github),
                              color: _isDarkMode ? Colors.white : Colors.black,
                              onPressed: () =>
                                  _launchWeb('https://github.com/Tarekali2027'),
                            ),
                            const SizedBox(width: 40),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.linkedin),
                              color: const Color(0xFF5090FF),
                              onPressed: () => _launchWeb(
                                  'https://www.linkedin.com/in/tarek-ahmed-1040432a4/'),
                            ),
                            const SizedBox(width: 40),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.whatsapp),
                              color: Colors.green,
                              onPressed: () => _launchWhatsApp('201064480857'),
                            ),
                            const SizedBox(width: 40),
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.solidEnvelope),
                              color: Colors.redAccent,
                              onPressed: () => _launchEmail('alit53125@gmail.com'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(String skill, double level) {
    final isDark = _isDarkMode;
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1E25) : const Color(0xFFDCEBFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color:
                isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: level,
            minHeight: 8,
            backgroundColor: isDark ? Colors.grey[800] : Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              isDark ? Colors.cyanAccent : Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${(level * 100).toInt()}%',
            style: GoogleFonts.poppins(
              color: isDark ? Colors.grey[400] : Colors.grey[700],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, String tech,
      String imagePath, String link) {
    final isDark = _isDarkMode;
    return Container(
      width: 260,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1E25) : const Color(0xFFDCEBFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color:
                isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, height: 140, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : Colors.grey[800],
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            tech,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: isDark ? Colors.cyanAccent : Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 12),
          
        ],
      ),
    );
  }
}
