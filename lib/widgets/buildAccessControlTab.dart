 import 'package:flutter/cupertino.dart';
import 'package:ping_me/widgets/buildNarrowAccessControlLayout.dart';
import 'package:ping_me/widgets/buildWideAccessControlLayout.dart';

Widget buildAccessControlTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600
              ? buildWideAccessControlLayout()
              : buildNarrowAccessControlLayout();
        },
      ),
    );
  }