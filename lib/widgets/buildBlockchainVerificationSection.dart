import 'package:flutter/material.dart';

Widget buildBlockchainVerificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Require blockchain identity verification for enterprise/DAO meetings',
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Verification Protocol',
            border: OutlineInputBorder(),
          ),
          value: 'Ethereum',
          items:
              ['Ethereum', 'Polygon', 'Solana'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
          onChanged: (newValue) {},
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Smart Contract Address (Optional)',
            border: OutlineInputBorder(),
            hintText: '0x...',
          ),
        ),
      ],
    );
  }
