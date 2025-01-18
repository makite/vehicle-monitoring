import 'dart:typed_data';

class Vehicle {
  String id;
  final String name;
  String status;
  String lastKnownLocation;
  String fuelLevel; // New field
  String batteryLevel; // New field
  Uint8List? imageData; // Change to store image as bytes

  Vehicle({
    required this.id,
    required this.name,
    required this.status,
    required this.lastKnownLocation,
    required this.fuelLevel,
    required this.batteryLevel,
    this.imageData, // Make imageData optional
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status,
        'lastKnownLocation': lastKnownLocation,
        'fuelLevel': fuelLevel,
        'batteryLevel': batteryLevel,
        'imageData': imageData != null
            ? imageData!.toList()
            : null, // Convert byte data to List<int>
      };

  factory Vehicle.fromJson(Map<String, dynamic> json, String id) {
    return Vehicle(
      id: id,
      name: json['name'] ?? 'Unknown',
      status: json['status'] ?? 'Unknown',
      lastKnownLocation: json['lastKnownLocation'] ?? 'Unknown',
      fuelLevel: json['fuelLevel'] ?? '0',
      batteryLevel: json['batteryLevel'] ?? '0',
      imageData: json['imageData'] != null
          ? Uint8List.fromList(List<int>.from(json['imageData']))
          : null, // Convert List<int> back to Uint8List
    );
  }
}
