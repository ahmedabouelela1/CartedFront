import '/backend/api_requests/api_calls.dart';
import '/components/empty_cart/empty_cart_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (DeleteCart)] action in IconButton widget.
  ApiCallResponse? deleteCartt;
  // Stores action output result for [Backend Call - API (DeleteCart)] action in IconButton widget.
  ApiCallResponse? deleteCart;
  // Stores action output result for [Backend Call - API (Check Stock)] action in Button widget.
  ApiCallResponse? checkStock;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
