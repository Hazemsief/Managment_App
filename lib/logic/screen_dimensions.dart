import 'package:flutter/material.dart';

const double desktopBreakpoint = 1100;
const double tabletBreakpoint = 850;

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= desktopBreakpoint;

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < tabletBreakpoint;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= tabletBreakpoint &&
    MediaQuery.of(context).size.width < desktopBreakpoint;

enum DeviceType { mobile, tablet, desktop }

DeviceType getDeviceType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width >= desktopBreakpoint) {
    return DeviceType.desktop;
  } else if (width >= tabletBreakpoint) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}
