import "package:flutter/material.dart";

/// The constant separators and spacing tokens used in the app,
/// following the Obsidian Finance Design System conventions.
class AppSeparators {
  // --- Spacing Tokens ---

  /// Base spacing size (4px)
  static const double base = 4;

  /// Extra small spacing size (4px)
  static const double xs = 4;

  /// Small spacing size (8px)
  static const double sm = 8;

  /// Medium spacing size (16px)
  static const double md = 16;

  /// Large spacing size (24px)
  static const double lg = 24;

  /// Extra large spacing size (32px)
  static const double xl = 32;

  /// Mobile margin (20px)
  static const double marginMobile = 20;

  /// Mobile gutter (12px)
  static const double gutterMobile = 12;

  // --- Vertical Separators (SizedBox height) ---

  /// Vertical extra-extra-small separator (4px)
  static const Widget vXs = SizedBox(height: xs);

  /// Vertical small separator (8px)
  static const Widget vSm = SizedBox(height: sm);

  /// Vertical medium separator (16px)
  static const Widget vMd = SizedBox(height: md);

  /// Vertical large separator (24px)
  static const Widget vLg = SizedBox(height: lg);

  /// Vertical extra large separator (32px)
  static const Widget vXl = SizedBox(height: xl);

  // --- Horizontal Separators (SizedBox width) ---

  /// Horizontal extra-extra-small separator (4px)
  static const Widget hXs = SizedBox(width: xs);

  /// Horizontal small separator (8px)
  static const Widget hSm = SizedBox(width: sm);

  /// Horizontal medium separator (16px)
  static const Widget hMd = SizedBox(width: md);

  /// Horizontal large separator (24px)
  static const Widget hLg = SizedBox(width: lg);

  /// Horizontal extra large separator (32px)
  static const Widget hXl = SizedBox(width: xl);

  // --- Layout Padding ---

  /// Page default padding (horizontal: 20px, vertical: 32px)
  /// Aligned with DESIGN.md margin-mobile and xl vertical padding.
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: marginMobile,
    vertical: xl,
  );
}
