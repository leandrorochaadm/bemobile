import 'package:bemobile/presentation/models_ui/employees_model_ui.dart';

abstract class EmployeeState {}

class EmployeeInitialState extends EmployeeState {}

class EmployeeEmptyState extends EmployeeState {}

class EmployeeLoadingState extends EmployeeState {}

class EmployeeLoadedState extends EmployeeState {
  final List<EmployeeModelUI> employees;
  EmployeeLoadedState(this.employees);
}

class EmployeeErrorState extends EmployeeState {
  final String message;
  EmployeeErrorState(this.message);
}
