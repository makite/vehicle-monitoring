import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vehicle_monitoring_app/core/widgets/custome_text_field.dart';
import 'package:vehicle_monitoring_app/features/dashboard/data/model/vehicle_model.dart';
import 'package:vehicle_monitoring_app/features/dashboard/presentation/manager/dashboard_bloc.dart';

class CommonVehicleDialog extends StatefulWidget {
  final Vehicle? vehicle;

  const CommonVehicleDialog({super.key, this.vehicle});

  @override
  _CommonVehicleDialogState createState() => _CommonVehicleDialogState();
}

class _CommonVehicleDialogState extends State<CommonVehicleDialog> {
  late TextEditingController nameController;
  late TextEditingController statusController;
  late TextEditingController locationController;
  late TextEditingController fuelLevelController;
  late TextEditingController batteryLevelController;
  Uint8List? imageData;
  final _formKey = GlobalKey<FormState>(); // Add a form key for validation

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.vehicle?.name ?? '');
    statusController =
        TextEditingController(text: widget.vehicle?.status ?? '');
    locationController =
        TextEditingController(text: widget.vehicle?.lastKnownLocation ?? '');
    fuelLevelController =
        TextEditingController(text: widget.vehicle?.fuelLevel ?? '');
    batteryLevelController =
        TextEditingController(text: widget.vehicle?.batteryLevel ?? '');
    imageData = widget.vehicle?.imageData;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Wrap fields with a Form widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.car_rental, color: Colors.blueAccent),
                        const SizedBox(width: 8),
                        Text(
                          widget.vehicle == null
                              ? 'Add Vehicle'
                              : 'Update Vehicle',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (imageData != null && imageData!.isNotEmpty)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.memory(imageData!,
                            height: 180, fit: BoxFit.cover),
                      )
                    else
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(Icons.car_repair,
                              size: 100, color: Colors.grey),
                        ),
                      ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: nameController,
                      labelText: 'Name',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: statusController,
                      labelText: 'Status',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Status is required';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: locationController,
                      labelText: 'Location',
                    ),
                    CustomTextField(
                      controller: fuelLevelController,
                      labelText: 'Fuel Level',
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      controller: batteryLevelController,
                      labelText: 'Battery Level',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          imageData = await pickedFile.readAsBytes();
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.upload),
                      label: const Text('Upload Image'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                          ),
                          child: const Text('Cancel',
                              style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              final vehicle = Vehicle(
                                id: widget.vehicle?.id ?? '',
                                name: nameController.text,
                                status: statusController.text,
                                lastKnownLocation: locationController.text,
                                fuelLevel: fuelLevelController.text,
                                batteryLevel: batteryLevelController.text,
                                imageData: imageData,
                              );

                              if (widget.vehicle == null) {
                                context
                                    .read<DashboardBloc>()
                                    .add(AddVehicle(vehicle));
                              } else {
                                context
                                    .read<DashboardBloc>()
                                    .add(UpdateVehicle(vehicle));
                              }

                              Navigator.of(context).pop();
                            }
                          },
                          child:
                              Text(widget.vehicle == null ? 'Add' : 'Update'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
