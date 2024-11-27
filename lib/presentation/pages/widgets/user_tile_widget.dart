import 'package:flutter/material.dart';

class UserTileWidget extends StatelessWidget {
  final String name;
  final String position;
  final String admissionDate;
  final String phone;

  const UserTileWidget({
    super.key,
    required this.name,
    required this.position,
    required this.admissionDate,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      child: ExpansionTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        trailing: const Icon(Icons.expand_more),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow('Cargo', position),
                _buildRow('Data de admissão', admissionDate),
                _buildRow('Telefone', phone),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
