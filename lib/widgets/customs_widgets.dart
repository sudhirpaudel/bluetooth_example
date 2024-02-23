import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBluetoothDeviceTile extends StatelessWidget {
  const CustomBluetoothDeviceTile({
    
    required this.deviceName,
    this.isPaired = false,
    this.isConnectedDeviceScreen = false,
    super.key,
  });

  final String deviceName;
  final bool isPaired;
  final bool isConnectedDeviceScreen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: isPaired ? Colors.green : Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(12)),
      leading: isConnectedDeviceScreen
          ? Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: Text("id",
                  style: Theme.of(context).appBarTheme.titleTextStyle),
            )
          : SvgPicture.asset(
              "assets/mesh.svg",
              height: 18,
              width: 18,
            ),
      title: Text(deviceName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      // subtitle: Text(isPaired ? "Disconnect" : "Pair",
      //     style: const TextStyle(fontSize: 16)),
     
      trailing: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          border: Border.all(
              color: isPaired ? Colors.green : Colors.grey, width: 4),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
