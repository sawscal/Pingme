import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class IpfsHttpService {
  static const String infuraUrl = 'https://ipfs.infura.io:5001/api/v0';

  // Upload to IPFS
  Future<String?> upload(String content) async {
    final uri = Uri.parse('$infuraUrl/add');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        utf8.encode(content),
        filename: 'file.txt',
      ),
    );

    final response = await request.send();
    final resBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final json = jsonDecode(resBody.replaceAll(RegExp(r'(\r\n|\r|\n)'), ''));
      return json['Hash'];
    } else {
      print('IPFS upload failed: $resBody');
      return null;
    }
  }

  // Fetch from IPFS
  Future<String?> fetch(String hash) async {
    final uri = Uri.parse('https://ipfs.io/ipfs/$hash');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('IPFS fetch failed: ${response.body}');
      return null;
    }
  }
}
