import 'package:flutter/material.dart';
import 'package:ping_me/widgets/buildBlockchainVerificationSection.dart';
import 'package:ping_me/widgets/buildEmailInviteSection.dart';
import 'package:ping_me/widgets/buildQrCodeSection.dart';
import 'package:ping_me/widgets/buildRoleCard.dart';

class InviteMethodSelector extends StatefulWidget {
  const InviteMethodSelector({Key? key}) : super(key: key);

  @override
  _InviteMethodSelectorState createState() => _InviteMethodSelectorState();
}

class _InviteMethodSelectorState extends State<InviteMethodSelector> {
  String _selectedInviteMethod = 'Email';  // Default selected invite method

  void _onInviteMethodSelected(String method) {
    setState(() {
      _selectedInviteMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Invite Participants via',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            buildRoleCard(
              context: context,
              role: 'Email',
              icon: Icons.email,
              description: 'Send invitation via email',
              isSelected: _selectedInviteMethod == 'Email',
              onTap: () => _onInviteMethodSelected('Email'),
            ),
            buildRoleCard(
              context: context,
              role: 'QR Code',
              icon: Icons.qr_code,
              description: 'Generate a QR code for the invite',
              isSelected: _selectedInviteMethod == 'QR Code',
              onTap: () => _onInviteMethodSelected('QR Code'),
            ),
            buildRoleCard(
              context: context,
              role: 'Blockchain',
              icon: Icons.verified_user,
              description: 'Invite using Blockchain verification',
              isSelected: _selectedInviteMethod == 'Blockchain',
              onTap: () => _onInviteMethodSelected('Blockchain'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Display the selected invite method section
        if (_selectedInviteMethod == 'Email')
          buildEmailInviteSection()
        else if (_selectedInviteMethod == 'QR Code')
            buildQrCodeSection(context)
        else if (_selectedInviteMethod == 'Blockchain')
          buildBlockchainVerificationSection(),
      ],
    );
  }
}
