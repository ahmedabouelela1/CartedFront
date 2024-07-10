import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue1;
  FormFieldController<List<String>>? choiceChipsValueController1;
  // State field(s) for Min widget.
  FocusNode? minFocusNode;
  TextEditingController? minController;
  String? Function(BuildContext, String?)? minControllerValidator;
  // State field(s) for Max widget.
  FocusNode? maxFocusNode;
  TextEditingController? maxController;
  String? Function(BuildContext, String?)? maxControllerValidator;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue2;
  FormFieldController<List<String>>? choiceChipsValueController2;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue3;
  FormFieldController<List<String>>? choiceChipsValueController3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    minFocusNode?.dispose();
    minController?.dispose();

    maxFocusNode?.dispose();
    maxController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
