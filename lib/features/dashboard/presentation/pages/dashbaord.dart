import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_monitoring_app/core/utils/textstyle.dart';
import 'package:vehicle_monitoring_app/core/utils/theme.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/manager/dashboard_bloc.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/widget/abaout.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/widget/common_dialog.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/widget/vehicle_list_view.dart';

class VehicleDashboard extends StatefulWidget {
  @override
  _VehicleDashboardState createState() => _VehicleDashboardState();
}

class _VehicleDashboardState extends State<VehicleDashboard> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(LoadVehicles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vehicle Dashboard',
          style: AppTextStyle.txtInterSemiBold18Lightgreen900,
        ),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.lightBlue900,
            ),
            onPressed: _showAboutDialog,
          ),
        ],
      ),
      body: VehicleListView(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => const AboutWidget(),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddDialog(context),
      backgroundColor: AppColors.primary,
      elevation: 12,
      shape: CircleBorder(),
      splashColor: AppColors.primary.withOpacity(0.7),
      tooltip: 'Add New Item',
      child: Icon(
        Icons.add_rounded,
        color: Colors.white,
        size: 32.sp,
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CommonVehicleDialog(),
    );
  }
}
