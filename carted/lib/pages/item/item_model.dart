import '/backend/api_requests/api_calls.dart';
import '/components/item_fav/item_fav_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'item_widget.dart' show ItemWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemModel extends FlutterFlowModel<ItemWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // Model for ItemFav component.
  late ItemFavModel itemFavModel;
  // Stores action output result for [Backend Call - API (UpdateFav)] action in ItemFav widget.
  ApiCallResponse? updateFavv;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // Stores action output result for [Backend Call - API (AddCart)] action in Button widget.
  ApiCallResponse? varToCart;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (AddFavorites)] action in IconButton widget.
  ApiCallResponse? addToFavorites;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue2;
  FormFieldController<List<String>>? choiceChipsValueController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    itemFavModel = createModel(context, () => ItemFavModel());
  }

  void dispose() {
    unfocusNode.dispose();
    itemFavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
