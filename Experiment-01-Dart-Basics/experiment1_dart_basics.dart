void main() {
  // 1. Variables and data types
  String studentName = 'Jaswanth';
  int rollNumber = 101;
  double attendancePercentage = 85.5;
  bool isEnrolled = true;

  print('===== STUDENT DETAILS =====');
  print('Name: $studentName');
  print('Roll Number: $rollNumber');
  print('Attendance: $attendancePercentage%');
  print('Currently Enrolled: $isEnrolled');

  // 2. Arithmetic operators
  int marks1 = 85;
  int marks2 = 90;
  int marks3 = 78;

  int totalMarks = marks1 + marks2 + marks3;
  double averageMarks = totalMarks / 3;

  print('\n===== MARKS =====');
  print('Total Marks: $totalMarks');
  print('Average Marks: $averageMarks');

  // 3. Conditional statements
  if (averageMarks >= 90) {
    print('Grade: A');
  } else if (averageMarks >= 75) {
    print('Grade: B');
  } else if (averageMarks >= 60) {
    print('Grade: C');
  } else {
    print('Grade: Needs Improvement');
  }

  // 4. Lists and loops
  print('\n===== SUBJECT MARKS =====');
  List<int> subjectMarks = [marks1, marks2, marks3];

  for (int i = 0; i < subjectMarks.length; i++) {
    print('Subject ${i + 1}: ${subjectMarks[i]}');
  }

  // 5. Functions
  displayWelcomeMessage(studentName);
}

void displayWelcomeMessage(String name) {
  print('\nWelcome to StudentHub, $name!');
}
