import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      _OnboardingViewed =
          prefs.getBool('ff_OnboardingViewed') ?? _OnboardingViewed;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _Token = '';
  String get Token => _Token;
  set Token(String _value) {
    _Token = _value;
    prefs.setString('ff_Token', _value);
  }

  bool _OnboardingViewed = false;
  bool get OnboardingViewed => _OnboardingViewed;
  set OnboardingViewed(bool _value) {
    _OnboardingViewed = _value;
    prefs.setBool('ff_OnboardingViewed', _value);
  }

  bool _VoucherVisibility = false;
  bool get VoucherVisibility => _VoucherVisibility;
  set VoucherVisibility(bool _value) {
    _VoucherVisibility = _value;
  }

  bool _ResetToken = false;
  bool get ResetToken => _ResetToken;
  set ResetToken(bool _value) {
    _ResetToken = _value;
  }

  int _onSale = 0;
  int get onSale => _onSale;
  set onSale(int _value) {
    _onSale = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
