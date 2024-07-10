import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'brands_component_model.dart';
export 'brands_component_model.dart';

class BrandsComponentWidget extends StatefulWidget {
  const BrandsComponentWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  }) : super(key: key);

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  _BrandsComponentWidgetState createState() => _BrandsComponentWidgetState();
}

class _BrandsComponentWidgetState extends State<BrandsComponentWidget> {
  late BrandsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BrandsComponentModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'ProdBrand',
                queryParameters: {
                  'brandID': serializeParam(
                    widget.parameter2,
                    ParamType.int,
                  ),
                }.withoutNulls,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                widget.parameter1!,
                width: 348.5,
                height: 241.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'ProdBrand',
                      queryParameters: {
                        'brandID': serializeParam(
                          widget.parameter2,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Text(
                    widget.parameter3!.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF6F0691),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
