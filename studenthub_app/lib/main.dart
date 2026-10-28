import 'package:flutter/material.dart';

void main() {
  runApp(const StudentHubApp());
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHub Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

// SCREEN 1: DASHBOARD
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentHub Dashboard'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 90, color: Colors.indigo),
              const SizedBox(height: 16),
              const Text(
                'Welcome to StudentHub!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: 240,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.menu_book),
                  label: const Text('View Subjects'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubjectsScreen(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: 240,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.assignment),
                  label: const Text('View Assignments'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AssignmentsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SCREEN 2: SUBJECTS
class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final List<String> subjects = const [
    'Data Structures',
    'Database Management Systems',
    'Operating Systems',
    'Computer Networks',
    'Software Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Subjects'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Text('${index + 1}'),
              ),
              title: Text(subjects[index]),
              subtitle: const Text('Academic subject'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}

// SCREEN 3: ASSIGNMENTS
class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  final List<Map<String, String>> assignments = const [
    {
      'title': 'Flutter UI Design',
      'subject': 'Mobile Application Development',
      'status': 'Pending',
    },
    {
      'title': 'SQL Queries',
      'subject': 'Database Management Systems',
      'status': 'Completed',
    },
    {
      'title': 'Data Structures Exercises',
      'subject': 'Data Structures',
      'status': 'Pending',
    },
    {
      'title': 'Operating Systems Report',
      'subject': 'Operating Systems',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Assignments'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: assignments.length,
        itemBuilder: (context, index) {
          final assignment = assignments[index];
          final isCompleted = assignment['status'] == 'Completed';

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                isCompleted ? Icons.check_circle : Icons.pending_actions,
                color: isCompleted ? Colors.green : Colors.orange,
                size: 32,
              ),
              title: Text(assignment['title']!),
              subtitle: Text(assignment['subject']!),
              trailing: Text(
                assignment['status']!,
                style: TextStyle(
                  color: isCompleted ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
