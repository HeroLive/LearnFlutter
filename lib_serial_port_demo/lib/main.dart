import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:libserialport/libserialport.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

extension IntToString on int {
  String toHex() => '0x${toRadixString(16)}';
  String toPadded([int width = 3]) => toString().padLeft(width, '0');
  String toTransport() {
    switch (this) {
      case SerialPortTransport.usb:
        return 'USB';
      case SerialPortTransport.bluetooth:
        return 'Bluetooth';
      case SerialPortTransport.native:
        return 'Native';
      default:
        return 'Unknown';
    }
  }
}

class _ExampleAppState extends State<ExampleApp> {
  var availablePorts = [];
  late SerialPort port;
  String str = 'A';

  @override
  void initState() {
    super.initState();
    initPorts();
  }

  void initPorts() {
    setState(() => availablePorts = SerialPort.availablePorts);
  }

  void connectPort(String address) {
    print(address);
    port = SerialPort(address);
    final reader = SerialPortReader(port);
    if (!port.openReadWrite()) {
      print(SerialPort.lastError);
    }
    reader.stream.listen(
      (data) {
        print('received: ');

        data.forEach((element) {
          String char = String.fromCharCode(element);
          print(char);
        });
      },
    );
  }

  void sendToPort() {
    if (str.contains('A')) {
      str = 'B';
    } else {
      str = 'A';
    }
    List<int> list = str.codeUnits;
    Uint8List bytes = Uint8List.fromList(list);
    port.write(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Serial Port example'),
        ),
        body: Scrollbar(
          child: ListView(
            children: [
              for (final address in availablePorts)
                Builder(builder: (context) {
                  // final port = SerialPort(address);
                  print(address);
                  return Row(
                    children: [
                      ElevatedButton(
                        child: Text(address),
                        onPressed: () {
                          connectPort(address);
                        },
                        // child: ExpansionTile(
                        //   title: Text(address),
                        //   children: [
                        //     CardListTile('Description', port.description),
                        //     CardListTile('Transport', port.transport.toTransport()),
                        //     CardListTile('USB Bus', port.busNumber?.toPadded()),
                        //     CardListTile(
                        //         'USB Device', port.deviceNumber?.toPadded()),
                        //     CardListTile('Vendor ID', port.vendorId?.toHex()),
                        //     CardListTile('Product ID', port.productId?.toHex()),
                        //     CardListTile('Manufacturer', port.manufacturer),
                        //     CardListTile('Product Name', port.productName),
                        //     CardListTile('Serial Number', port.serialNumber),
                        //     CardListTile('MAC Address', port.macAddress),
                        //   ],
                        // ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            sendToPort();
                          },
                          child: Text("Button"))
                    ],
                  );
                }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: initPorts,
        ),
      ),
    );
  }
}

class CardListTile extends StatelessWidget {
  final String name;
  final String? value;

  CardListTile(this.name, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value ?? 'N/A'),
        subtitle: Text(name),
      ),
    );
  }
}

// import 'dart:ffi';
// import 'dart:typed_data';

// import 'package:libserialport/libserialport.dart';

// void main() {
//   final name = SerialPort.availablePorts.elementAt(0);
//   final port = SerialPort(name);
//   if (!port.openReadWrite()) {
//     print(SerialPort.lastError);
//   }

//   final reader = SerialPortReader(port);
//   reader.stream.listen((data) {
//     List<int> list = data;
//     Uint8List bytes = Uint8List.fromList(list);
//     data.forEach((element) {
//       String char = String.fromCharCode(element);
//       print('received: $char');
//     });
//     port.write(bytes);
//   });
// }
