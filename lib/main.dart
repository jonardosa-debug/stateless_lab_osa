import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// 1. Student Data Class
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// 2. List of at least 5 Student objects (Hard-coded)
const List<Student> students = [
  Student(
    name: 'Khen Lumindas',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'Khen.lumindas@csucc.edu.ph',
  ),
  Student(
    name: 'Jimmy Abenoja',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'Jimmy.Abenoja@csucc.edu.ph',
  ),
  Student(
    name: 'John Hope Maribao',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'Johnhope.Maribao@csucc.edu.ph',
  ),
  Student(
    name: 'Alexander Camacho',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'Alexander.Camacho@csucc.edu.ph',
  ),
  Student(
    name: 'Jay Aguelo',
    course: 'BS Data Science',
    yearLevel: 3,
    email: 'Jay.Aguelo@csucc.edu.ph',
  ),
];

// Stateless because it only builds the app configuration once.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Directory',
      // CUSTOMIZATION 1: Theme Data with a custom Teal color scheme.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 13, 148, 136), // Changed to Teal
          primary: const Color.fromARGB(255, 13, 148, 136), 
        ),
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless because the list of students is hard-coded and does not change.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Campus Directory',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'),
          ...students.map((student) => StudentCard(student: student)),
        ],
      ),
    );
  }
}

// Stateless because it only displays the title passed to it.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            // CUSTOMIZATION 2: Custom TextStyle for the header (bold and primary color).
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8.0),
          const Divider(thickness: 1.0, color: Colors.grey),
        ],
      ),
    );
  }
}

// Stateless because it just displays the Student data passed to it.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final String initial = student.name.isNotEmpty ? student.name[0] : '?';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      // CUSTOMIZATION 3: Custom Card shape (rounded corners) and subtle border.
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: Colors.black12, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  initial,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(221, 133, 66, 66),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      student.course,
                      style: const TextStyle(
                        fontSize: 13.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InfoRow(
                      icon: Icons.school,
                      text: 'Year ${student.yearLevel}',
                    ),
                    const SizedBox(height: 4.0),
                    InfoRow(
                      icon: Icons.email,
                      text: student.email,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Stateless because it just displays an icon and text from its constructor.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14.0,
          color: const Color.fromARGB(255, 13, 148, 136), // Teal color for icons
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.0,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}