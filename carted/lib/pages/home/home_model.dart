import '/backend/api_requests/api_calls.dart';
import '/components/bestselling/bestselling_widget.dart';
import '/components/fav_icon/fav_icon_widget.dart';
import '/components/featured_brands/featured_brands_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;
  // Stores action output result for [Backend Call - API (UpdateFav)] action in FavIcon widget.
  ApiCallResponse? updateFav;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    listViewController = ScrollController();
    gridViewController = ScrollController();
  }

  void dispose() {
    unfocusNode.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    listViewController?.dispose();
    gridViewController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
