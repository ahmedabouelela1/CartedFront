import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pass_reset_widget.dart' show PassResetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PassResetModel extends FlutterFlowModel<PassResetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Pass widget.
  FocusNode? passFocusNode;
  TextEditingController? passController;
  late bool passVisibility;
  String? Function(BuildContext, String?)? passControllerValidator;
  // State field(s) for PassConf widget.
  FocusNode? passConfFocusNode;
  TextEditingController? passConfController;
  late bool passConfVisibility;
  String? Function(BuildContext, String?)? passConfControllerValidator;
  // Stores action output result for [Backend Call - API (Password Reset)] action in Button widget.
  ApiCallResponse? apiResultat5;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passVisibility = false;
    passConfVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    passFocusNode?.dispose();
    passController?.dispose();

    passConfFocusNode?.dispose();
    passConfController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
