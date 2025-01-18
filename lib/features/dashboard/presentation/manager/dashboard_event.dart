part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadVehicles extends DashboardEvent {}

class UpdateVehicle extends DashboardEvent {
  final Vehicle vehicle;

  UpdateVehicle(this.vehicle);

  @override
  List<Object> get props => [vehicle];
}

class AddVehicle extends DashboardEvent {
  final Vehicle vehicle;

  AddVehicle(this.vehicle);

  @override
  List<Object> get props => [vehicle];
}
