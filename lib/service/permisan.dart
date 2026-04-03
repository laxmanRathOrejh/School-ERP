// permissions.dart
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  /// Check and request Microphone permission
  static Future<bool> checkMicrophonePermission() async {
    // 1. Check if permission is already granted
    if (await Permission.microphone.isGranted) return true;

    // 2. Request permission
    var result = await Permission.microphone.request();

    // 3. If granted after request
    if (result.isGranted) return true;

    // 4. If permanently denied → open app settings
    if (result.isPermanentlyDenied) {
      await openAppSettings(); // opens phone settings
      return false;
    }

    // 5. Denied
    return false;
  }
}