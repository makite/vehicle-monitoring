import 'package:flutter/material.dart';
import 'package:vehicle_monitoring_app/core/utils/image_constant.dart';
import 'package:vehicle_monitoring_app/core/utils/textstyle.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/model/vehicle_model.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  const VehicleCard({
    Key? key,
    required this.vehicle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Model: ${vehicle.name}',
                    style: AppTextStyle.txtInterSemiBold18Lightgreen900,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Status: ${vehicle.status}',
                    style: AppTextStyle.boldtxtInterRegular16Lightblue900,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                  aspectRatio: 16 / 7,
                  child:
                      vehicle.imageData != null && vehicle.imageData!.isNotEmpty
                          ? Image.memory(
                              vehicle.imageData!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.carImage2,
                              fit: BoxFit.cover,
                            )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Battery: ${vehicle.batteryLevel}',
                    style: AppTextStyle.txtInterRegular14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Location: ${vehicle.lastKnownLocation}',
                    style: AppTextStyle.txtInterRegular14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Fuel: ${vehicle.fuelLevel}',
                    style: AppTextStyle.txtInterRegular14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
