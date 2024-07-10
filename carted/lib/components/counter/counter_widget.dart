import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';
export 'counter_model.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final dynamic parameter1;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late CounterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CounterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 120.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xFFE0E3E7),
            width: 2.0,
          ),
        ),
        child: FlutterFlowCountController(
          decrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.minus,
            color: enabled ? Color(0xFF57636C) : Color(0xFFE0E3E7),
            size: 14.0,
          ),
          incrementIconBuilder: (enabled) => FaIcon(
            FontAwesomeIcons.plus,
            color: enabled ? Color(0xFF0F1113) : Color(0xFFE0E3E7),
            size: 14.0,
          ),
          countBuilder: (count) => Text(
            count.toString(),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF0F1113),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          count: _model.countControllerValue ??= widget.parameter1!,
          updateCount: (count) =>
              setState(() => _model.countControllerValue = count),
          stepSize: 1,
          contentPadding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        ),
      ),
    );
  }
}
