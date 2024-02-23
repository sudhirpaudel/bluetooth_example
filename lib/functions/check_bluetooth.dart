import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<bool> checkBluetoothPermissions() async {
  // Check Bluetooth permission
  PermissionStatus permissionStatus = await Permission.bluetooth.status;
  print(permissionStatus);
  if (permissionStatus != PermissionStatus.granted) {
    // Request Bluetooth permission if not granted
    permissionStatus = await Permission.bluetooth.request();
  }

  // Check Bluetooth state after permission is granted
  if (permissionStatus == PermissionStatus.granted) {
    return isBluetoothOn();
  } else {
    return false;
  }
}

Future<bool> isBluetoothOn() async {
  try {
    BluetoothAdapterState adapterState =
        await FlutterBluePlus.adapterState.first;
    return adapterState == BluetoothAdapterState.on;
  } catch (e) {
    print('Error checking Bluetooth state: $e');
    return false;
  }
}
