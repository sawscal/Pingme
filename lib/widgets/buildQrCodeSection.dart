import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildQrCodeSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Generate a unique QR code that participants can scan to join',
        style: TextStyle(color: Colors.grey),
      ),
      const SizedBox(height: 16),
      Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Icon(Icons.qr_code_2, size: 100, color: Colors.grey),
          ),
        ),
      ),
      const SizedBox(height: 8),
      const Center(
        child: Text(
          'QR code will be generated when meeting is scheduled',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
        ),
      ),
    ],
  );
}
