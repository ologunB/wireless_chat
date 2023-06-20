import 'dart:io';

import 'package:hive_flutter/adapters.dart';
import 'package:wakelock/wakelock.dart';
import 'package:wireless_chat/services/receiver_service.dart';
import 'package:wireless_chat/services/sharing_object.dart';
import 'package:wireless_chat/services/sharing_service.dart';

import 'ip_service.dart';

class WirelessService {
  static LocalIpService _ipService = LocalIpService();
  static ReceiverService receiverService = ReceiverService();
  static SharingService? _sharingService = SharingService();

  static init() async {
    if (!Platform.isLinux) {
      Wakelock.enable();
    }
    _ipService.load();
    await receiverService.init();
    await Hive.initFlutter();
    await Hive.openBox<String>('strings');

    print(receiverService.receivers.length);
  }

  static sendMessage(String text) async {
    late SharingObject file = SharingObject(
      type: SharingObjectType.text,
      data: text,
      name: SharingObject.getSharingName(SharingObjectType.text, text),
    );
    await _sharingService?.end();
    await _sharingService?.start(file);
  }
}
