import 'package:flutter/material.dart';
import 'package:learn_leap/core/constants/text_style.dart';
import 'package:learn_leap/core/utils/utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;

  /// biggest text
  ///
  /// fontSize `32`
  /// fontWeight `700`
  AppText.heading1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.lineHeight,
    this.wordSpacing,
    this.fontWeight,
  })  : style = headingStyle1.copyWith(color: color),
        super(key: key);

  /// h2 text
  ///
  // fontSize `24`
  // fontWeight `700`
  AppText.heading2(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = headingStyle2.copyWith(color: color),
        super(key: key);

  /// h3 text
  ///
  /// fontSize `20`
  /// fontWeight `700`
  AppText.heading3(this.text,
      {Key? key,
      this.multiText = true,
      this.overflow = TextOverflow.ellipsis,
      this.color,
      this.maxLines,
      this.centered = false,
      this.textAlign,
      this.fontSize,
      this.wordSpacing,
      this.lineHeight,
      this.letterSpacing,
      this.fontWeight})
      : style = headingStyle3.copyWith(color: color),
        super(key: key);

  /// h4text
  //
  // / fontSize `18`
  // / fontWeight `700`
  AppText.heading4(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.lineHeight,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.fontWeight,
  })  : style = headingStyle4.copyWith(
          color: color,
          fontSize: fontSize,
        ),
        super(key: key);

  /// h5 text
  ///
  /// fontSize `14`
  /// fontWeight `700`
  AppText.heading5(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = headingStyle5.copyWith(color: color),
        super(key: key);

  /// h6 text
  ///
  /// fontSize `12`
  /// fontWeight `700`
  AppText.heading6(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = headingStyle6.copyWith(color: color),
        super(key: key);

  /// h6 text
  ///
  /// fontSize `16`
  /// fontWeight `700`
  AppText.button(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = buttonStyle.copyWith(color: color),
        super(key: key);

  /// normal body text
  ///
  /// fontSize `16`
  AppText.regular(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = regularStyle.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        super(key: key);

  /// medium body text
  ///
  /// fontSize `14`
  AppText.medium(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = mediumStyle.copyWith(
            color: color, fontSize: fontSize, fontWeight: fontWeight),
        super(key: key);

  /// small text
  ///
  /// fontSize `12`
  AppText.small(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = smallStyle.copyWith(
            color: color, fontSize: fontSize, fontWeight: fontWeight),
        super(key: key);

  /// semibold text
  ///
  /// fontSize `10`
  AppText.caption(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.lineHeight,
    this.fontWeight,
  })  : style = captionStyle.copyWith(
            color: color, fontSize: fontSize, fontWeight: fontWeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style.copyWith(
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        color: color ?? AppColors.textColor,
        height: lineHeight,
        fontSize: fontSize,
      ),
    );
  }
}
