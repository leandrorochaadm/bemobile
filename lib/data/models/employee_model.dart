import '../../domain/entities/employee_entity.dart';

class EmployeeModel {
  EmployeeModel({
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

  factory EmployeeModel.fromJson(dynamic json) {
    return EmployeeModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      job: json["job"] ?? "",
      admissionDate: DateTime.tryParse(json["admission_date"] ?? ""),
      phone: json["phone"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job": job,
        "admission_date": admissionDate?.toIso8601String(),
        "phone": phone,
        "image": image,
      };

  toEntity() => EmployeeEntity(
        id: id,
        name: name,
        job: job,
        admissionDate: admissionDate,
        phone: phone,
        image: image,
      );
}
