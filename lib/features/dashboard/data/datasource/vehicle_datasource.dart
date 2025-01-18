import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/model/vehicle_model.dart';
import 'package:injectable/injectable.dart';

abstract class VehicleRemoteDataSource {
  Future<List<Vehicle>> fetchVehicles();
  Future<void> updateVehicle(Vehicle vehicle);
  Future<void> addVehicle(Vehicle vehicle);
}

@Injectable(as: VehicleRemoteDataSource)
class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final FirebaseFirestore _firestore;

  VehicleRemoteDataSourceImpl(this._firestore);

  @override
  Future<List<Vehicle>> fetchVehicles() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('vehicles').get();
      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Vehicle.fromJson(data, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load vehicles: $e');
    }
  }

  @override
  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      DocumentReference docRef =
          await _firestore.collection('vehicles').add(vehicle.toJson());
      vehicle.id = docRef.id; // Update the ID in the vehicle object
      await docRef.set(vehicle.toJson(), SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to add vehicle: $e');
    }
  }

  @override
  Future<void> updateVehicle(Vehicle vehicle) async {
    try {
      await _firestore
          .collection('vehicles')
          .doc(vehicle.id)
          .update(vehicle.toJson());
    } catch (e) {
      throw Exception('Failed to update vehicle: $e');
    }
  }
}
