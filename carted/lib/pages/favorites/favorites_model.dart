import '/backend/api_requests/api_calls.dart';
import '/components/empty_favorites/empty_favorites_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'favorites_widget.dart' show FavoritesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritesModel extends FlutterFlowModel<FavoritesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (DeleteFavorites)] action in IconButton widget.
  ApiCallResponse? deleteFavorite;
  // Stores action output result for [Backend Call - API (DeleteFavorites)] action in IconButtonSale widget.
  ApiCallResponse? deleteFavoriteSale;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
