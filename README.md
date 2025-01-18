# Vehicle Monitoring App

Vehicle Monitoring App is a mobile application built using **Flutter**, designed to help users track, optimize, and enhance their fleet with real-time vehicle monitoring solutions. The app allows users to manage vehicle data, view dashboard statistics, and add new vehicles to the system.

## Features

- **Dashboard** displaying vehicle information.
- Ability to **add new vehicles** via a floating action button.
- **Real-time vehicle tracking** and updates by clicking on cards.
- **Vehicle health and status** tracking.
- **Customizable settings** for managing fleet.
- **User-friendly and visually appealing interface**.

## Future Enhancements

### TextController Management via BLoC
Transition all `TextController` management to **BLoC** for more centralized form data handling. This allows for more flexible UI updates, better state management, and enhanced scalability as the app grows.

### State Management Consistency
Currently, some parts of the app rely on built-in state management solutions. Moving forward, we will replace these with **BLoC** for uniformity across the entire app, ensuring better maintainability and a more scalable architecture.

### Improved Error Handling
A robust error handling system will be implemented through **BLoC** to manage form validation and global error states. This will improve app reliability and user experience by providing real-time feedback during interactions.

These improvements will enhance the app's architecture, streamline data flow, and enable easier future updates as the application scales.

## Prerequisites

To run this app on your machine, you need to have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A compatible mobile emulator or a physical device for testing

### Installing Dependencies

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/vehicle-monitoring.git

   cd vehicle_monitoring_app
   flutter pub get

