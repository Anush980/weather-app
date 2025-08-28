import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequest extends StatefulWidget {
  final Widget child;
  const PermissionRequest({super.key, required this.child});

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  bool _granted = false;

  @override
  void initState() {
    super.initState();
    _requestLocation();
  }

  Future<void> _requestLocation() async {
    final status = await Permission.location.request();
    setState(() {
      _granted = status.isGranted;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show nothing (or a splash) until permission is granted
    if (!_granted) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Permission granted → show the real app
    return widget.child;
  }
}
