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

  double weight = 0;
  double ft = 0;
  double inch = 0;

  var result = "";
  var msg = "";
  var bgcolor;

  void bmiCalulate() {
    if (weightController.text.isEmpty ||
        ftController.text.isEmpty ||
        inchController.text.isEmpty) {
      setState(() {
        result = "Please fill all the fields!";
      });
    } else {
      weight = double.parse(weightController.text);
      ft = double.parse(ftController.text);
      inch = double.parse(inchController.text);

      double totalInch = (ft * 12) + inch;
      double heightInMeter = totalInch * 0.0254;

      double bmi = weight / (heightInMeter * heightInMeter);

      if (bmi < 18.5) {
        msg = "You are underweight";
        bgcolor = Colors.yellow.shade200;
      } else if (bmi >= 18.5 && bmi < 25) {
        msg = "You are normal weight";
        bgcolor = Colors.green.shade200;
      } else if (bmi >= 25 && bmi < 30) {
        msg = "You are overweight";
        bgcolor = Colors.orange.shade200;
      } else {
        msg = "You are obese";
        bgcolor = Colors.red.shade200;
      }

      setState(() {
        result = "Your BMI is ${bmi.toStringAsFixed(2)}";
        msg = msg;
        bgcolor = bgcolor;
      });
    }
  }

  @override
  void dispose() {
    weightController.dispose();
    ftController.dispose();
    inchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        shadowColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(color: bgcolor ?? Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Hi! Let's calculate your BMI",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

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

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: bmiCalulate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: const Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "$result\n$msg.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
