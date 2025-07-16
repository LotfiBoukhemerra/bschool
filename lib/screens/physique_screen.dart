import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PhysiqueScreen extends StatefulWidget {
  const PhysiqueScreen({super.key});

  @override
  State<PhysiqueScreen> createState() => _PhysiqueScreenState();
}

class _PhysiqueScreenState extends State<PhysiqueScreen> {
  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdfecef),
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildHeader(),
                    const SizedBox(width: 30),
                    _buildProgressIndicators(),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 20),
                _buildFilterTabs(),
                const SizedBox(height: 20),
                _buildLessonList(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFdfecef),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Bschool_logo.png', height: 45),
          const SizedBox(width: 8),
          const Text(
            'Bschool',
            style: TextStyle(
              color: Color(0xFF004A66),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
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
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Physique',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Text('Chapitre 1:', style: TextStyle(fontSize: 16, color: Colors.grey)),
        SizedBox(height: 4),
        Text(
          'Oxydoréduction',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildProgressIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: 0.60,
          center: const Text(
            "60%",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          progressColor: const Color(0xFF60C689),
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        const SizedBox(width: 10),
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 8.0,
          percent: 0.70,
          center: const Text(
            "70%",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          progressColor: const Color(0xFFFFC908),
          backgroundColor: Colors.grey.shade300,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ],
    );
  }

  Widget _buildFilterTabs() {
    final List<String> filters = ['Tout', 'Cours', 'Exercices'];
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: List.generate(filters.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilterIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _selectedFilterIndex == index
                      ? Colors.white
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: _selectedFilterIndex == index
                      ? [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: .3),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ]
                      : [],
                ),
                child: Text(
                  filters[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004A66),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLessonList() {
    return Column(
      children: const [
        LessonCard(
          title: "Les bases",
          subtitle: "Séance 4 : partie 1",
          duration: "32:45",
          isCompleted: true,
          isFavorite: true,
          isCourse: true,
        ),
        SizedBox(height: 12),
        LessonCard(
          title: "Exercice 2",
          subtitle: "Séance 4 : partie 2",
          duration: "26:33",
          isCompleted: false,
          isFavorite: false,
          isCourse: false,
        ),
        SizedBox(height: 12),
        LessonCard(
          title: "Exercice 3",
          subtitle: "Séance 4 : partie 3",
          duration: "26:33",
          isCompleted: true,
          isFavorite: false,
          isCourse: false,
        ),
        SizedBox(height: 12),
        LessonCard(
          title: "Tableau D'avancement",
          subtitle: "",
          duration: "32:45",
          isCompleted: true,
          isFavorite: false,
          isCourse: true,
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: 4, // "Matières" is selected
      selectedItemColor: const Color(0xFF004A66),
      unselectedItemColor: Colors.grey,
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

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final bool isCompleted;
  final bool isFavorite;
  final bool isCourse;

  const LessonCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.isCompleted,
    required this.isFavorite,
    required this.isCourse,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isCourse
        ? const Color(0xFFE3F2F7)
        : const Color(0xFFFEF7E5);
    final playButtonColor = isCourse
        ? const Color(0xFF007297)
        : const Color(0xFFFFB800);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: playButtonColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 38),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    if (subtitle.isNotEmpty) const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: playButtonColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            duration,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (isCompleted)
                          const Row(
                            children: [
                              Icon(Icons.circle, color: Colors.green, size: 8),
                              SizedBox(width: 4),
                              Text(
                                'Terminé',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.amber : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
