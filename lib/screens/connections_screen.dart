import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nordic_nrf_mesh_example/functions/check_bluetooth.dart';
import 'package:nordic_nrf_mesh_example/src/widgets/snackbar.dart';

import 'bluettoth_pairing_screen.dart';
import 'mesh_screen.dart';

class ConnectionsScreen extends StatelessWidget {
  const ConnectionsScreen({super.key});

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connections'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const SizedBox(height: 20),
              const SizedBox(width: double.infinity),
              const Center(
                  child: SizedBox(
                      width: 170,
                      child: CustomConnectedDeviceTile("Mesh Name", 12))),
              // Center(
              //   child: GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       crossAxisSpacing: 10,
              //       mainAxisSpacing: 10,
              //       childAspectRatio: 2.5,
              //     ),
              //     itemBuilder: (context, index) {
              //       return Center(
              //           child: CustomConnectedDeviceTile("Mesh Name", 12));
              //     },
              //     itemCount: 1,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //   ),
              // ),

              const SizedBox(height: 30),

              /// Button to navigate to Mesh screen , which displays the connected devices
              /// in the mesh
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: "Show connected devices",
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      Get.to(() => const MeshScreen());
                    }),
              ),
              const SizedBox(height: 20),

              /// Button to navigate to the Bluetooth screen to connect to a device
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: "Connect to a device",
                    backgroundColor: Colors.blue,
                    onPressed: () async {
                      if (await checkBluetoothPermissions()) {
                        Get.to(() => const BluetoothPairingScreen());
                      } else {
                       // ignore: use_build_context_synchronously
                       showSnackBar(context, 'Turn on the bluetooth', false);
                      }
                    }),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, thickness: 2),
              const SizedBox(height: 10),

              /// Button to test the device
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: "Test the device",
                    backgroundColor: Colors.green,
                    onPressed: () {}),
              ),

              const SizedBox(height: 20),

              /// Text box to display the app logs
              const TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "App logs are displayed here"),
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  /// Button to share the logs
                  Expanded(
                    child: CustomButton(
                        title: "Share",
                        icon: Icons.share,
                        backgroundColor: Colors.blue,
                        onPressed: () {}),
                  ),
                  const SizedBox(width: 10),

                  /// Button to clear the logs
                  Expanded(
                    child: CustomButton(
                        title: "Clear",
                        icon: Icons.clear,
                        backgroundColor: Colors.red,
                        onPressed: () {}),
                  )
                ],
              )
            ]),
          ),
        )));
  }
}

class CustomConnectedDeviceTile extends StatelessWidget {
  const CustomConnectedDeviceTile(
    this.meshName,
    this.deviceCount, {
    super.key,
  });
  final String meshName;
  final int deviceCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue, width: 1.5),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset("assets/mesh.svg", width: 20, height: 20),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meshName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("${deviceCount} devices",
                style: const TextStyle(fontSize: 14)),
          ],
        )
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.backgroundColor,
    this.onPressed,
    this.icon,
    super.key,
  });
  final String title;
  final Color backgroundColor;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: icon != null ? Icon(icon) : const SizedBox(),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        ),
        onPressed: onPressed,
        label: FittedBox(
          child: Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ));
  }
}

