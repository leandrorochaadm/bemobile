import 'package:flutter/material.dart';

import 'core/app_config.dart';
import 'core/app_depencendies.dart';
import 'core/theme/theme.dart';
import 'presentation/pages/employees_page.dart';

void main() {
  debugPrint('Base URL: ${AppConfig.baseUrl}');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BeMobile',
      theme: AppTheme.lightTheme,

      // poderia ser utilizado um class AppRoutes, porem como é um app de apenas uma tela, nenhuma rota seria necessaria
      home: EmployeesPage(
        // poderia ser utilizado o GetIt ou o Provider, mas um app é pequeno, gerenciador de dependências não é necessario
        employeeNotifier: AppDependencies.createEmployeeNotifier(),
      ),
    );
  }
}
