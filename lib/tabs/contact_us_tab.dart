import 'package:fip5/tabs/tabs_screen.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../utils/ui/custom_widget.dart';

class ContactUsTab extends StatefulWidget {
  const ContactUsTab({Key? key}) : super(key: key);

  @override
  State<ContactUsTab> createState() => _ContactUsTabState();
}

class _ContactUsTabState extends State<ContactUsTab> {
  @override
  Widget build(BuildContext context) {
    return CustomWidget(color: Colors.green, title: S.of(context).contactUs);
  }
}
