import 'package:flutter/material.dart';
import 'calculate_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 100;
  int weight = 30;
  int age = 15;
  bool isMaleSelected = true;
  bool isFemaleSelected = true;

  double calculatebmi() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0x0b0c20),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.sort,
            color: Colors.white,
          ), // Tambahkan icon menu
          onPressed: () {
            // Logika Menu
          },
        ),
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => isMaleSelected = true),
                child: GenderCard(
                  icon: Icons.male,
                  label: "MALE",
                  selected: isMaleSelected,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => setState(() => isMaleSelected = false),
                child: GenderCard(
                  icon: Icons.female,
                  label: "FEMALE",
                  selected: !isMaleSelected,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          HeightSlider(
            height: height,
            onHeightChanged: (newHeight) => setState(() => height = newHeight),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WeightAgeCard(
                label: "WEIGHT",
                value: weight,
                onIncrement: () => setState(() => weight++),
                onDecrement: () => setState(() => weight--),
              ),
              const SizedBox(width: 15),
              WeightAgeCard(
                label: "AGE",
                value: age,
                onIncrement: () => setState(() => age++),
                onDecrement: () => setState(() => age--),
              ),
            ],
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalculatePage(bmi: calculatebmi()),
                ),
              );
              // Tambahkan logika perhitungan BMI di sini
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 49),
              color: const Color(0xFFE91E63),
              child: const Center(
                child: Text(
                  "CALCULATE YOUR BMI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const GenderCard({
    required this.icon,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: selected ? Colors.blueAccent : Colors.white10,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: selected ? Colors.white : Colors.grey),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onHeightChanged;

  const HeightSlider({required this.height, required this.onHeightChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white10),
      child: Column(
        children: [
          const Text(
            "HEIGHT",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text.rich(
            TextSpan(
              text: "${height.toInt()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: " cm",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ),
          Slider(
            value: height,
            min: 100,
            max: 220,
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            onChanged: onHeightChanged,
          ),
        ],
      ),
    );
  }
}

class WeightAgeCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const WeightAgeCard({
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33), // Warna sesuai tema
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), //mengatur dari angka weight age ke button add minus
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tombol "-" dengan latar belakang lingkaran
              
              Expanded(
                child: ElevatedButton(
                  
                  onPressed: onDecrement,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xFF111328), // Warna latar tombol
                  ),
                  child: const Icon(Icons.remove, color: Colors.white, size: 30),
                ),
              ),
              const SizedBox(width: 5), //mengatur jarak antara icon remove sm add
              // Tombol "+" dengan latar belakang lingkaran
              Expanded(
                child: ElevatedButton(
                  onPressed: onIncrement,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: const Color(0xFF111328), // Warna latar tombol
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}