import 'package:flutter/material.dart';

class CgpaCalculator extends StatelessWidget {
  final List<double> grades = [4.0, 4.0, 3.7, 3.8, 3.0, 3.0];
  final List<double> credits = [4, 4, 4, 4, 3, 3];

  double calculateCGPA() {
    double totalGradePoints = 0;
    double totalCredits = 0;

    for (int i = 0; i < grades.length; i++) {
      totalGradePoints += grades[i] * credits[i];
      totalCredits += credits[i];
    }

    return totalCredits > 0 ? totalGradePoints / totalCredits : 0.0;
  }

  String getComment(double cgpa) {
    if (cgpa >= 3.80) {
      return "Excellent! You're performing exceptionally well.";
    } else if (cgpa >= 3.50) {
      return "Great job! Keep up the good work.";
    } else if (cgpa >= 3.00) {
      return "You're doing alright. Consider putting in some extra effort.";
    } else {
      return "You might need to focus on your studies more to improve.";
    }
  }

  Color getCommentColor(double cgpa) {
    if (cgpa >= 3.80) {
      return Colors.green; // Excellent (green)
    } else if (cgpa >= 3.50) {
      return Colors.teal; // Great (teal)
    } else if (cgpa >= 3.00) {
      return Colors.orange; // Alright (orange)
    } else {
      return Colors.red; // Needs improvement (red)
    }
  }

  @override
  Widget build(BuildContext context) {
    final double cgpa = calculateCGPA();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Grades and Credits for per Subjects:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Container(
            width: 300, 
            child: Card(
              elevation: 4.0, 
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6, // Assuming 6 subjects
                  itemBuilder: (context, index) {
                    return Text(
                      "Subject ${index + 1}: Grade = ${grades[index].toStringAsFixed(1)}, Credit = ${credits[index].toStringAsFixed(1)}",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    );
                  },
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Your CGPA: ${cgpa.toStringAsFixed(2)}",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 51, 101, 143)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            getComment(cgpa),
            style: TextStyle(fontSize: 18, color: getCommentColor(cgpa)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
