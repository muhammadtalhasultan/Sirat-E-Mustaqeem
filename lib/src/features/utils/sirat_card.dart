import 'package:flutter/material.dart';

import '../../core/util/constants.dart';

class SiratCard extends StatelessWidget {
  const SiratCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: kPagePadding,
      padding: kCardPadding,
      decoration: BoxDecoration(
        borderRadius: kCardBorderRadius,
        color: Theme.of(context).colorScheme.background,
      ),
      child: child,
    );
  }
}
