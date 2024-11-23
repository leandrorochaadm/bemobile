class EmployeeEntity {
  EmployeeEntity({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  final String id;
  final String name;
  final String job;
  final DateTime? admissionDate;
  final String phone;
  final String image;
}
