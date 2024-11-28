import 'package:flutter/material.dart';

import '../../core/app_depencendies.dart';
import '../../core/theme/theme.dart';
import 'employees_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EmployeesPage(
            employeeNotifier: AppDependencies.createEmployeeNotifier(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(
        child: Container(
          color: AppColors.bluePrimary,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
