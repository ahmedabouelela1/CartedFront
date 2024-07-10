import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_fav_model.dart';
export 'item_fav_model.dart';

class ItemFavWidget extends StatefulWidget {
  const ItemFavWidget({
    Key? key,
    bool? isFavParam,
  })  : this.isFavParam = isFavParam ?? false,
        super(key: key);

  final bool isFavParam;

  @override
  _ItemFavWidgetState createState() => _ItemFavWidgetState();
}

class _ItemFavWidgetState extends State<ItemFavWidget> {
  late ItemFavModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemFavModel());

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
            color: Color(0xFF9A1EC8),
            size: 32.0,
          );
        } else {
          return Icon(
            Icons.favorite_border,
            color: Color(0xFF9A1EC8),
            size: 32.0,
          );
        }
      },
    );
  }
}
