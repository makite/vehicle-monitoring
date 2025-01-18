import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/datasource/vehicle_datasource.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/model/vehicle_model.dart';
import 'package:vehicle_monitoring_app/injection.dart'; // Ensure this points to your injection setup

part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadVehicles>((event, emit) async {
      emit(VehicleLoading());
      try {
        final vehicles = await getIt<VehicleRemoteDataSource>().fetchVehicles();
        emit(VehicleLoaded(vehicles));
      } catch (_) {
        emit(VehicleError("Failed to fetch vehicles"));
      }
    });

    on<UpdateVehicle>((event, emit) async {
      try {
        await getIt<VehicleRemoteDataSource>().updateVehicle(event.vehicle);
        add(LoadVehicles()); // Refresh the vehicle list
      } catch (_) {
        emit(VehicleError("Failed to update vehicle"));
      }
    });

    on<AddVehicle>((event, emit) async {
      try {
        await getIt<VehicleRemoteDataSource>().addVehicle(event.vehicle);
        add(LoadVehicles()); // Refresh the vehicle list
      } catch (_) {
        emit(VehicleError("Failed to add vehicle"));
      }
    });
  }
}
