import 'package:client_app/widgets/store/store_settings.dart';
import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;
  final List<Map<String, dynamic>> steps = [
    {'title': 'Store Settings', 'content': const StoreSettings()},
    // {'title': 'Store Niche', 'content': 'Test'},
    // {'title': 'Payment', 'content': 'Test'},
    // {'title': 'Build', 'content': 'Tessst'},
  ];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepTapped: (int step) => setState(() => _currentStep = step),
      onStepContinue: _currentStep < steps.length - 1
          ? () => setState(() => _currentStep += 1)
          : null,
      onStepCancel:
          _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
      steps: steps.map((item) {
        return Step(
          title: Text(item['title']),
          content: item['content'],
        );
      }).toList(),
    );
  }
}
