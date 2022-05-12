
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'conf.dart' as conf;
import 'localization.dart';
import 'util.dart' as util;

showAbout(BuildContext context) async {

  final localizations = AppLocalizations.of(context);
  final platform = Theme.of(context).platform;

  //
  String appName;
  String appVersion;

  PackageInfo packageInfo;
  try {
    packageInfo = await PackageInfo.fromPlatform();
    appName = packageInfo.appName;
    appVersion = packageInfo.version;
  } catch (e) {
    appName = localizations.appTitle;
    appVersion = kIsWeb ? "Web" : () {
      var name = platform.toString();
      name = name.substring(platform.toString().lastIndexOf(".")+1);
      return name.substring(0, 1).toUpperCase() + name.substring(1);
    }();
  }

  showAboutDialog(context: context,
      applicationIcon: SizedBox(
        width: 48, height: 48,
        child: Image.asset("assets/icon.png"),
      ),
      applicationName: appName,
      applicationVersion: appVersion,
      applicationLegalese: conf.appLegalese,
      children: [
        SizedBox(height: 8,),
      ]
  );
}
