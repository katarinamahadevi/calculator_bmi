import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  final double bmi;
  final double containerSize; // Tambahkan variabel untuk mengatur ukuran container

  const CalculatePage({super.key, required this.bmi, this.containerSize = 300}); // Default ukuran container

  String getBMIStatus() {
    if (bmi < 18.5) return "UNDERWEIGHT";
    if (bmi < 25) return "NORMAL";
    if (bmi < 30) return "OVERWEIGHT";
    return "OBESE";
  }

  Color getStatusColor() {
    if (bmi < 18.5) return Colors.yellow;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF0A0E21),
    appBar: AppBar(
      backgroundColor: const Color(0xFF0A0E21),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.sort, color: Colors.white),
        onPressed: () {},
      ),
      title: const Text(
        "BMI CALCULATOR",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(40 , 40, 0, 0),
          child: Text(
            "Your Result",
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only (top: 40, bottom: 40, right: 40, left:40 ), //mengatur ukuran container
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1D1F33),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Text(
                  getBMIStatus(),
                  style: TextStyle(
                    color: getStatusColor(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  bmi.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Normal BMI range:",
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
                const Text(
                  "18.5 - 25 kg/m²",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30, width: 30,),
                Text(
                  bmi < 18.5
                      ? "You are underweight."
                      : bmi < 25
                          ? "You have a normal body weight. Good job!"
                          : "You are overweight. Consider a healthier lifestyle.",
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    backgroundColor: const Color(0xFF0A0E21),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "SAVE RESULT",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: double.infinity, // Menempel ke tepi layar
            height: 90,
            color: const Color(0xFFE91E63),
            alignment: Alignment.center,
            child: const Text(
              "RE-CALCULATE YOUR BMI",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}