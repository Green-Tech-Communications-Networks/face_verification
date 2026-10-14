import 'dart:async';

import 'package:gtcomnet_face_id/controller/face_capture_cubit.dart';
import 'package:gtcomnet_face_id/face_pose.dart';
import 'package:gtcomnet_face_id/sdk_welcome_screen.dart';
import 'package:flutter/material.dart';

class FaceVerification {
  /// Call once at app startup so camera discovery and the face-detection
  /// model are ready before the user opens capture.
  static Future<void> preload() => FaceCaptureController.preload();

  static void launchCamera(
    BuildContext context, {
    required void Function(List<CapturedFaceImage> files) onSuccess,
    VoidCallback? onCancel,
  }) {
    unawaited(FaceCaptureController.prepareCamera());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SdkWelcomePage(onSuccess: onSuccess, onCancel: onCancel),
        // FaceCaptureScreen(onSuccess: onSuccess, onCancel: onCancel),
      ),
    );
  }

  void configure({
    Color? backgroundColor,
    Widget? topWidgets,
    Widget? bottomWidgets,
  }) {}
}
