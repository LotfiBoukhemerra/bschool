import 'package:flutter/material.dart';

// Dummy data for subject cards
const List<Map<String, String>> subjectData = [
  {
    "title": "Arabe",
    "level": "Troisième année",
    "image": "assets/images/Arabe_image.png",
  },
  {
    "title": "Science",
    "level": "Troisième année",
    "image": "assets/images/Science_image.png",
  },
  {
    "title": "Physique",
    "level": "Troisième année",
    "image": "assets/images/Physique_image.png",
  },
  {
    "title": "Math",
    "level": "Troisième année",
    "image": "assets/images/math_image.png",
  },
  {
    "title": "Philosophie",
    "level": "Troisième année",
    "image": "assets/images/Philosophie_image.png",
  },
  {
    "title": "Physique 2",
    "level": "Deuxième année",
    "image": "assets/images/Physique_2_image.png",
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF004A66,
      ), // A slightly darker blue for behind the curve
      body: Stack(
        children: [
          // Yellow background
          Container(
            margin: const EdgeInsets.only(top: 250),
            color: const Color(0xFFFFC908),
          ),
          SingleChildScrollView(
            child: Column(
              children: [_buildHeader(context), _buildSubjectList(context)],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 30),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF004A66),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back, color: Colors.white),
              Row(
                children: [
                  Image.asset(
                    'assets/images/Bschool_logo_white_notext.png',
                    height: 45,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Bschool',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            'Bienvenu, Derdiche',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Veuillez choisir une matière.',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Chercher une matière',
              hintStyle: TextStyle(color: Colors.grey[600]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectList(BuildContext context) {
    return Container(
      color: const Color(0xFFFFC908),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: subjectData.map((subject) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: _SubjectCard(
              title: subject['title']!,
              level: subject['level']!,
              imagePath: subject['image']!,
              onTap: () {
                if (subject['title'] == 'Physique') {
                  Navigator.pushNamed(context, '/physique');
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: Color(0xFF004A66)),
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: const TextStyle(
        color: Color(0xFF004A66),
        fontSize: 12,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: 4,
      selectedItemColor: const Color(0xFF004A66),
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoris'),
        BottomNavigationBarItem(icon: Icon(Icons.satellite_alt), label: 'Zoom'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Matières'),
      ],
    );
  }
}

class _SubjectCard extends StatelessWidget {
  final String title;
  final String level;
  final String imagePath;
  final VoidCallback onTap;

  const _SubjectCard({
    required this.title,
    required this.level,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF007297),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    level,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: .8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Consulter',
                          style: TextStyle(color: Color(0xFF007297)),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Color(0xFF007297),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(imagePath, height: 100, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
