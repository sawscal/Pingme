import 'dart:convert';
import 'package:http/http.dart' as http;

class QuantumMessengerService {
  final String _baseUrl = 'http://127.0.0.1:8080';  // Change if necessary

  // Generate Key Pair (Kyber1024)
  Future<Map<String, String>?> generateKeyPair() async {
    final response = await http.get(Uri.parse('$_baseUrl/generate-keys'));

    if (response.statusCode == 200) {
      // Successfully received the key pair
      final responseData = json.decode(response.body);
      return {
        'publicKey': responseData['public_key_b64'],
        'privateKey': responseData['secret_key_b64'],
      };
    } else {
      throw Exception('Failed to generate key pair');
    }
  }

  // Upload file to IPFS
  Future<String?> uploadFile(List<int> fileData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/upload'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'data': fileData}),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['ipfs_hash'];
    } else {
      throw Exception('Failed to upload file');
    }
  }
}
