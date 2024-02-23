import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:nordic_nrf_mesh_example/main.dart';
import 'package:nordic_nrf_mesh_example/screens/connections_screen.dart';
import 'package:nordic_nrf_mesh_example/widgets/customs_widgets.dart';
//import 'package:nordic_nrf_mesh_example/widgets/customs_widgets.dart';

class BluetoothPairingScreen extends StatefulWidget {
  const BluetoothPairingScreen({super.key});

  @override
  State<BluetoothPairingScreen> createState() => _BluetoothPairingScreenState();
}

class _BluetoothPairingScreenState extends State<BluetoothPairingScreen> {
  final controller = TextEditingController();
  final _ble = FlutterReactiveBle();
  List<DiscoveredDevice> devices = [];

  @override
  void initState() {
    super.initState();
    scanForDevices();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void scanForDevices() {
    devices = [];
    _ble.scanForDevices(
      withServices: [],
      scanMode: ScanMode.lowLatency,
    ).listen((device) {
      // Add the discovered device to the list
      if (!devices.any((existingDevice) => existingDevice.id == device.id)) {
        setState(() {
          devices.add(device);
        });
      }
    }, onError: (dynamic error) {
      // Handle errors
      print('Error during scanning: $error');
    });
  }

  void connectToDevice(DiscoveredDevice device) {
    try {
      _ble.connectToDevice(
        id: device.id,
        connectionTimeout: const Duration(seconds: 5),
      );
      print('Connected to device: ${device.id}');
    } catch (error) {
      print('Error connecting to device: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Set random connected devices for demonstration purposes
    connectedDevices = [0, 3, 7];
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: controller,
            style: Theme.of(context).appBarTheme.titleTextStyle,
            decoration: InputDecoration(
              hintText: 'Your Mesh Name',
              hintStyle: Theme.of(context).appBarTheme.titleTextStyle,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Select the device you want to connect",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          )),

                      const SizedBox(height: 20),

                      // Expanded(
                      //   child: ListView.separated(
                      //     separatorBuilder: (context, index) =>
                      //         const SizedBox(height: 15),
                      //     itemBuilder: (context, index) {
                      //       return CustomBluetoothDeviceTile(
                      //         deviceName: "Device $index",
                      //         isPaired: index.isEven,
                      //         isConnectedDeviceScreen: true,
                      //       );
                      //     },
                      //     itemCount: 6,
                      //     shrinkWrap: true,
                      //     physics: const BouncingScrollPhysics(),
                      //   ),
                      // ),

                      Expanded(
                        child: ListView.builder(
                          itemCount: devices.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // connectToDevice(devices[index]);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: CustomBluetoothDeviceTile(
                                    deviceName: devices[index].id),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Row(
                      //   children: [
                      //     /// Button to share the logs
                      //     Expanded(
                      //       child: CustomButton(
                      //         title: "Apply",
                      //         backgroundColor: Colors.blue,
                      //         onPressed: () {

                      //         },
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),

                      //     /// Button to clear the logs
                      //     Expanded(
                      //       child: CustomButton(
                      //           title: "Clear",
                      //           backgroundColor: Colors.red,
                      //           onPressed: () {}),
                      //     )
                      //   ],
                      // ),

                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Center(
                          child: CustomButton(
                            title: "Refresh",
                            backgroundColor: Colors.blue,
                            onPressed: () {
                              setState(() {
                                scanForDevices();
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// List of all available devices
                    ]),),),);
  }
}
