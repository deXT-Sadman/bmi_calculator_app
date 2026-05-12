import "package:flutter/material.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "BMI",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),

            TextField(
              controller: weightController,
              decoration: InputDecoration(
                label: const Text("Enter your weight (in KG): "),
                prefixIcon: const Icon(Icons.line_weight_outlined),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: ftController,
              decoration: InputDecoration(
                label: const Text("Enter your height (in feet): "),
                prefixIcon: const Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: inchController,
              decoration: InputDecoration(
                label: const Text("Enter your height (in inch): "),
                prefixIcon: const Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
