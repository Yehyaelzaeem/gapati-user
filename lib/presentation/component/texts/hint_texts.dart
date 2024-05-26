
import 'package:flutter/cupertino.dart';

import '../../../core/global/styles/styles.dart';


class HintBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;

  const HintBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: labelStyle ??
          TextStyles.font21Hint700Weight.copyWith(fontSize: fontSize ?? 21, color: labelColor, fontWeight: FontWeight.bold),
    );
  }
}

class HintRegularText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  const HintRegularText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.labelColor,
    this.fontSize, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines?? 2,
      style: labelStyle ??
          TextStyles.font14CustomGray400Weight.copyWith(fontSize: fontSize ?? 14, color: labelColor),
    );
  }
}

class HintMediumText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;
  final int? maxLines;

  const HintMediumText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        label,
        textAlign: textAlign,
        maxLines: maxLines?? 2,
        style: style ??
            TextStyles.font16CustomGray500Weight.copyWith(fontSize: fontSize ?? 16, color: labelColor),
      ),
    );
  }
}

class HintSemiBoldText extends StatelessWidget {
  final String label;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? labelColor;
  final double? fontSize;

  const HintSemiBoldText({
    Key? key,
    required this.label,
    this.textAlign = TextAlign.start,
    this.style,
    this.labelColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: style ??
          TextStyles.font18CustomGray600Weight.copyWith(fontSize: fontSize ?? 16, color: labelColor),
    );
  }
}