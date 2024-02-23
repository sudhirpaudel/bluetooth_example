import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_example/main.dart';
import 'package:nordic_nrf_mesh_example/screens/connections_screen.dart';
//import 'package:nordic_nrf_mesh_example/widgets/customs_widgets.dart';

class MeshScreen extends StatelessWidget {
  const MeshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Set random connected devices for demonstration purposes
    connectedDevices = [0, 3, 7];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mesh Name'),
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

                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          itemBuilder: (context, index) {
                            return const SizedBox();

                            // CustomBluetoothDeviceTile(
                            //     deviceName: "Device $index",
                            //     isPaired: index.isEven);
                          },
                          itemCount: 6,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          /// Button to share the logs
                          Expanded(
                            child: CustomButton(
                                title: "Connect",
                                icon: Icons.bluetooth_connected,
                                backgroundColor: Colors.blue,
                                onPressed: () {}),
                          ),
                          const SizedBox(width: 10),

                          /// Button to clear the logs
                          Expanded(
                            child: CustomButton(
                                title: "Refresh",
                                icon: Icons.refresh,
                                backgroundColor: Colors.red,
                                onPressed: () {}),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),

                      /// List of all available devices
                    ]))));
  }
}
