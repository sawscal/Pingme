import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ping_me/service/QuantumMessengerService.dart';
// Import the API service

class QuantumSettingsCard extends StatelessWidget {
  const QuantumSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantum Messenger Settings',
             style: GoogleFonts.lato(
    textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
  ),
            ),
            const SizedBox(height: 12),

            // Key Generation Button
            ElevatedButton(
              onPressed: () async {
                try {
                  final keyPair = await QuantumMessengerService().generateKeyPair();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Key Pair Generated: ${keyPair?['publicKey']}')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to generate key pair')),
                  );
                }
              },
              child: const Text('Generate Key Pair'),
            ),
            const SizedBox(height: 16),

            // File Upload Button
            ElevatedButton(
              onPressed: () async {
                // Simulating file data (replace with actual file picker and data)
                List<int> fileData = [/* Add file data here */];

                try {
                  final ipfsHash = await QuantumMessengerService().uploadFile(fileData);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('File uploaded to IPFS: $ipfsHash')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to upload file')),
                  );
                }
              },
              child: const Text('Upload File to IPFS'),
            ),
          ],
        ),
      ),
    );
  }
}
