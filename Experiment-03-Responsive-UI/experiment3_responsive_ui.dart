import 'package:flutter/material.dart';

void main() {
  runApp(const StudentHubApp());
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudentHub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(Icons.account_circle, size: 30),
          ),
        ],
      ),

      // Adjust the layout according to the available width.
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final isMobile = width < 600;
          final isTablet = width >= 600 && width < 1000;

          final int columns;

          if (isMobile) {
            columns = 1;
          } else if (isTablet) {
            columns = 2;
          } else {
            columns = 4;
          }

          final double pagePadding = isMobile ? 16 : 28;

          return SingleChildScrollView(
            padding: EdgeInsets.all(pagePadding),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Student! 👋',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Your academic progress at a glance.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),

                    const SizedBox(height: 28),

                    const Text(
                      'Your Overview',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Responsive summary card grid.
                    GridView.count(
                      crossAxisCount: columns,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: isMobile ? 3.2 : 1.5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SummaryCard(
                          title: 'Subjects',
                          value: '6',
                          icon: Icons.menu_book,
                          color: Colors.blue,
                        ),
                        SummaryCard(
                          title: 'Assignments',
                          value: '4',
                          icon: Icons.assignment,
                          color: Colors.orange,
                        ),
                        SummaryCard(
                          title: 'Attendance',
                          value: '85%',
                          icon: Icons.calendar_month,
                          color: Colors.green,
                        ),
                        SummaryCard(
                          title: 'Completed',
                          value: '12',
                          icon: Icons.task_alt,
                          color: Colors.purple,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    const Text(
                      'Upcoming Assignments',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Assignment cards also adapt to screen width.
                    if (isMobile)
                      const Column(
                        children: [
                          AssignmentCard(
                            title: 'Data Analytics',
                            subtitle: 'Regression assignment',
                            icon: Icons.analytics,
                            color: Colors.blue,
                          ),
                          AssignmentCard(
                            title: 'Flutter Development',
                            subtitle: 'Create a user interface',
                            icon: Icons.phone_android,
                            color: Colors.deepPurple,
                          ),
                          AssignmentCard(
                            title: 'Database Management',
                            subtitle: 'Complete SQL exercises',
                            icon: Icons.storage,
                            color: Colors.teal,
                          ),
                        ],
                      )
                    else
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AssignmentCard(
                              title: 'Data Analytics',
                              subtitle: 'Regression assignment',
                              icon: Icons.analytics,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: AssignmentCard(
                              title: 'Flutter Development',
                              subtitle: 'Create a user interface',
                              icon: Icons.phone_android,
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: AssignmentCard(
                              title: 'Database Management',
                              subtitle: 'Complete SQL exercises',
                              icon: Icons.storage,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.lightbulb, color: Colors.indigo, size: 32),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Stay organized and keep learning '
                              'every day!',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            label: 'Tasks',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Reusable summary card.
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
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

// Reusable assignment card.
class AssignmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const AssignmentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: color.withAlpha(30),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
