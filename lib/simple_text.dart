import 'package:flutter/material.dart';
import 'package:flutter_application_1/data_pool.dart';

class SimpleText extends StatelessWidget {
  final String dataKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String Function(int)? transform;

  const SimpleText({
    super.key,
    required this.dataKey,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.transform,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<dynamic>(
      valueListenable: DataPool.getValueNotifier(dataKey),
      builder: (context, value, child) {
        print('SimpleText build: ${DataPool.getIntData('counter')}');
        return Text(
          DataPool.getStringData(dataKey),
          style: style,
          textAlign: textAlign,
          overflow: overflow,
          maxLines: maxLines,
        );
      },
    );
  }
}
