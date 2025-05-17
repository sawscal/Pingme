 import 'package:flutter/cupertino.dart';
import 'package:ping_me/widgets/buildInviteMethodSection.dart';
import 'package:ping_me/widgets/buildRoleBasedAccessSection.dart';
import 'package:ping_me/widgets/buildSecuritySettingsSection.dart';

Widget buildNarrowAccessControlLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoleBasedAccessSection(),
        const SizedBox(height: 24),
        InviteMethodSelector(),
        const SizedBox(height: 24),
        SecuritySettingsScreen(),
      ],
    );
  }