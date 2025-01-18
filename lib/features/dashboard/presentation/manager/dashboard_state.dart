part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  DashboardState();
  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class VehicleLoading extends DashboardState {}

class VehicleLoaded extends DashboardState {
  final List<Vehicle> vehicles;

  VehicleLoaded(this.vehicles);
}

class VehicleError extends DashboardState {
  final String message;

  VehicleError(this.message);
}
