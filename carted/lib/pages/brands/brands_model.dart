import '/backend/api_requests/api_calls.dart';
import '/components/brands_component/brands_component_widget.dart';
import '/components/empty_brands/empty_brands_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'brands_widget.dart' show BrandsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrandsModel extends FlutterFlowModel<BrandsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
