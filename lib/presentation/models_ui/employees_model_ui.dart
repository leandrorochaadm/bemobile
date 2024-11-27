import 'package:intl/intl.dart';

import '../../domain/entities/employee_entity.dart';

class EmployeeModelUI {
  final String name;
  final String job;
  final String admissionDate;
  final String phone;
  final String image;

  EmployeeModelUI({
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  static String _formatDate(DateTime? date) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String _formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length != 13) {
      return '';
    }

    final countryCode = phoneNumber.substring(0, 2);
    final areaCode = phoneNumber.substring(2, 4);
    final prefix = phoneNumber.substring(4, 9);
    final suffix = phoneNumber.substring(9);

    return '+$countryCode ($areaCode) $prefix-$suffix';
  }

  factory EmployeeModelUI.fromEntity(EmployeeEntity entity) {
    final formatDate = _formatDate(entity.admissionDate);
    final formattedPhone = _formatPhoneNumber(entity.phone);

    return EmployeeModelUI(
      name: entity.name,
      job: entity.job,
      admissionDate: formatDate,
      phone: formattedPhone,
      image: entity.image,
    );
  }
}
