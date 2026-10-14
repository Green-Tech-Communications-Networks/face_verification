import 'package:face_verification/config/face_capture_config.dart';
import 'package:face_verification/controller/face_capture_cubit.dart';
import 'package:face_verification/controller_select.dart';
import 'package:face_verification/pose_guide.dart';
import 'package:flutter/material.dart';

class InstructionLayer extends StatelessWidget {
  final FaceCaptureConfig config;
  final FaceCaptureController controller;

  const InstructionLayer({
    super.key,
    required this.config,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 24,
      right: 24,
      child: ControllerSelect<int>(
        controller: controller,
        selector: (state) => state.currentStepIndex,
        builder: (context, _) {
          final step = controller.currentStep;
          return config.instructionBuilder?.call(context, step) ??
              RepaintBoundary(
                child: PoseGuideGif(
                  assetPath: step.assetIcon!,
                  command: step.instruction,
                  subtitle: step.subtitle,
                  number: step.number,
                ),
              );
        },
      ),
    );
  }
}
