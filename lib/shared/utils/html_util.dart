import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlUtil {
  static Widget build({required String html}) {
    return Html(
      data: html,
      style: {
        '*': Style(
          lineHeight: const LineHeight(1.5),
        ),
        'p': Style(
          fontSize: FontSize(12),
          fontWeight: FontWeight.w400,
        ),
      },
    );
  }
}
