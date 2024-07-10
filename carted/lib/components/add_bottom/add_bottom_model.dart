import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'add_bottom_widget.dart' show AddBottomWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddBottomModel extends FlutterFlowModel<AddBottomWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  String? _cityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for FullAddress widget.
  FocusNode? fullAddressFocusNode;
  TextEditingController? fullAddressController;
  String? Function(BuildContext, String?)? fullAddressControllerValidator;
  String? _fullAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Building widget.
  FocusNode? buildingFocusNode;
  TextEditingController? buildingController;
  String? Function(BuildContext, String?)? buildingControllerValidator;
  String? _buildingControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Apartment widget.
  FocusNode? apartmentFocusNode;
  TextEditingController? apartmentController;
  String? Function(BuildContext, String?)? apartmentControllerValidator;
  String? _apartmentControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (AddAddress)] action in Button widget.
  ApiCallResponse? addAddress;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cityControllerValidator = _cityControllerValidator;
    fullAddressControllerValidator = _fullAddressControllerValidator;
    buildingControllerValidator = _buildingControllerValidator;
    apartmentControllerValidator = _apartmentControllerValidator;
  }

  void dispose() {
    cityFocusNode?.dispose();
    cityController?.dispose();

    fullAddressFocusNode?.dispose();
    fullAddressController?.dispose();

    buildingFocusNode?.dispose();
    buildingController?.dispose();

    apartmentFocusNode?.dispose();
    apartmentController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
