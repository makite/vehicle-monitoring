import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/model/vehicle_model.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/manager/dashboard_bloc.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/widget/common_dialog.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/widget/vehicle_card.dart'; // Import the new widget

class VehicleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state is VehicleLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is VehicleError) {
          return Center(child: Text(state.message));
        } else if (state is VehicleLoaded) {
          return ListView.builder(
            itemCount: state.vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = state.vehicles[index];
              return VehicleCard(
                vehicle: vehicle,
                onTap: () => _showUpdateDialog(context, vehicle),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  void _showUpdateDialog(BuildContext context, Vehicle vehicle) {
    showDialog(
      context: context,
      builder: (context) => CommonVehicleDialog(vehicle: vehicle),
    );
  }
}
