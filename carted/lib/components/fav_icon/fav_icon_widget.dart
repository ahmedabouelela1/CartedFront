import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fav_icon_model.dart';
export 'fav_icon_model.dart';

class FavIconWidget extends StatefulWidget {
  const FavIconWidget({
    Key? key,
    bool? isFavParam,
  })  : this.isFavParam = isFavParam ?? false,
        super(key: key);

  final bool isFavParam;

  @override
  _FavIconWidgetState createState() => _FavIconWidgetState();
}

class _FavIconWidgetState extends State<FavIconWidget> {
  late FavIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavIconModel());

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

    return Builder(
      builder: (context) {
        if (widget.isFavParam == true) {
          return Icon(
            Icons.favorite_sharp,
            color: Color(0xFFA932A9),
            size: 24.0,
          );
        } else {
          return Icon(
            Icons.favorite_border,
            color: Color(0xFFA932A9),
            size: 24.0,
          );
        }
      },
    );
  }
}
