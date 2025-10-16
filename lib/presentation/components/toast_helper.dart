import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastHelper {
  static void showError(String message) {
    _showCustomSnackbar(
      message,
      Icons.error_outline,
      Colors.red,
      Colors.red.shade50,
    );
  }

  static void showSuccess(String message) {
    _showCustomSnackbar(
      message,
      Icons.check_circle_outline,
      Colors.green,
      Colors.green.shade50,
    );
  }

  static void showWarning(String message) {
    _showCustomSnackbar(
      message,
      Icons.warning_amber_rounded,
      Colors.orange,
      Colors.orange.shade50,
    );
  }

  static void showInfo(String message) {
    _showCustomSnackbar(
      message,
      Icons.info_outline,
      Colors.blue,
      Colors.blue.shade50,
    );
  }

  static void _showCustomSnackbar(
    String message,
    IconData icon,
    Color borderColor,
    Color bgColor,
  ) {
    Get.closeAllSnackbars();

    Get.rawSnackbar(
      messageText: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 14, color: borderColor),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              message,
              style: TextStyle(
                color: borderColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.1, // biar teks tidak tinggi
              ),
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      borderColor: borderColor,
      borderWidth: 1,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      borderRadius: 20,
      animationDuration: const Duration(milliseconds: 250),
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
    );
  }
}
