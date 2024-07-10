import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forget_password_widget.dart' show ForgetPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordModel extends FlutterFlowModel<ForgetPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // Stores action output result for [Backend Call - API (Forgot Password)] action in Button widget.
  ApiCallResponse? forgotPass;
  // State field(s) for Token widget.
  FocusNode? tokenFocusNode;
  TextEditingController? tokenController;
  String? Function(BuildContext, String?)? tokenControllerValidator;
  // Stores action output result for [Backend Call - API (Check Token)] action in Button widget.
  ApiCallResponse? checkToken;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    tokenFocusNode?.dispose();
    tokenController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
