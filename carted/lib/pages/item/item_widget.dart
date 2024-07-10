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
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'item_model.dart';
export 'item_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({
    Key? key,
    required this.prodId,
  }) : super(key: key);

  final int? prodId;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late ItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: NoAuthGroup.productsCall.call(
        prodId: widget.prodId?.toString(),
        authToken: FFAppState().Token,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final itemProductsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor: Color(0xFF6F0691),
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Item',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                    ),
                    actions: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.shopping_cart,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 25.0,
                        ),
                        onPressed: () async {
                          context.pushNamed('Cart');
                        },
                      ),
                    ],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        if (getJsonField(
                              itemProductsResponse.jsonBody,
                              r'''$.product.variations[:].attributes.size''',
                            ) !=
                            null) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.65,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: Builder(
                                          builder: (context) {
                                            final img =
                                                (NoAuthGroup.productsCall.img(
                                                      itemProductsResponse
                                                          .jsonBody,
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList() ??
                                                    [];
                                            return Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.65,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: PageView.builder(
                                                      controller: _model
                                                              .pageViewController1 ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  0,
                                                                  img.length -
                                                                      1)),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: img.length,
                                                      itemBuilder:
                                                          (context, imgIndex) {
                                                        final imgItem =
                                                            img[imgIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    FlutterFlowExpandedImageView(
                                                                  image: Image
                                                                      .network(
                                                                    imgItem,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  allowRotation:
                                                                      false,
                                                                  tag: imgItem,
                                                                  useHeroAnimation:
                                                                      true,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Hero(
                                                            tag: imgItem,
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child:
                                                                  Image.network(
                                                                imgItem,
                                                                width: 300.0,
                                                                height: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: smooth_page_indicator
                                                          .SmoothPageIndicator(
                                                        controller: _model
                                                                .pageViewController1 ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    img.length -
                                                                        1)),
                                                        count: img.length,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        onDotClicked:
                                                            (i) async {
                                                          await _model
                                                              .pageViewController1!
                                                              .animateToPage(
                                                            i,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        effect: smooth_page_indicator
                                                            .ExpandingDotsEffect(
                                                          expansionFactor: 3.0,
                                                          spacing: 8.0,
                                                          radius: 16.0,
                                                          dotWidth: 16.0,
                                                          dotHeight: 8.0,
                                                          dotColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          activeDotColor:
                                                              Color(0xFF6F0691),
                                                          paintStyle:
                                                              PaintingStyle
                                                                  .fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.updateFavv =
                                                          await UpdateFavCall
                                                              .call(
                                                        authToken:
                                                            FFAppState().Token,
                                                        prodId: widget.prodId,
                                                      );
                                                      if ((_model.updateFavv
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.updateFavv
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1250),
                                                            backgroundColor:
                                                                Color(
                                                                    0xE3BF5DE5),
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .clearSnackBars();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              getJsonField(
                                                                (_model.updateFavv
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$.message''',
                                                              ).toString(),
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xE3BF5DE5),
                                                          ),
                                                        );
                                                      }

                                                      setState(() {});
                                                    },
                                                    child: wrapWithModel(
                                                      model:
                                                          _model.itemFavModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ItemFavWidget(
                                                        isFavParam: NoAuthGroup
                                                            .productsCall
                                                            .isFav(
                                                          itemProductsResponse
                                                              .jsonBody,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            itemProductsResponse.jsonBody,
                                            r'''$.product.brand.brand_name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF6F0690),
                                                fontSize: 15.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 0.0),
                                  child: Text(
                                    NoAuthGroup.productsCall
                                        .prodName(
                                          itemProductsResponse.jsonBody,
                                        )
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF0F1113),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 6.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                NoAuthGroup.productsCall
                                                    .newPrice(
                                                      itemProductsResponse
                                                          .jsonBody,
                                                    )
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                'LE',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          if (NoAuthGroup.productsCall.onSale(
                                            itemProductsResponse.jsonBody,
                                          ))
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  NoAuthGroup.productsCall
                                                      .price(
                                                        itemProductsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                                Text(
                                                  'LE',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    NoAuthGroup.productsCall
                                                        .percentage(
                                                          itemProductsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF6F0690),
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '% Off',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF6F0690),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                      Container(
                                        width: 130.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? Color(0xFF57636C)
                                                : Color(0xFFE0E3E7),
                                            size: 18.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? Color(0xFF0F1113)
                                                : Color(0xFFE0E3E7),
                                            size: 18.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          count: _model
                                              .countControllerValue1 ??= 1,
                                          updateCount: (count) => setState(() =>
                                              _model.countControllerValue1 =
                                                  count),
                                          stepSize: 1,
                                          minimum: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (NoAuthGroup.productsCall
                                            .desc(
                                              itemProductsResponse.jsonBody,
                                            )
                                            .toString() ==
                                        'null'
                                    ? false
                                    : true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 5.0),
                                    child: Text(
                                      NoAuthGroup.productsCall
                                          .desc(
                                            itemProductsResponse.jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    'Avilable Sizes:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFF6F0690),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 32.0),
                                          child: FlutterFlowChoiceChips(
                                            options: (NoAuthGroup.productsCall
                                                    .size(
                                              itemProductsResponse.jsonBody,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList()!
                                                .map((label) => ChipData(label))
                                                .toList(),
                                            onChanged: (val) => setState(() =>
                                                _model.choiceChipsValue1 =
                                                    val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFFC777D9),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                              elevation: 2.0,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFFE0E3E7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              iconColor: Color(0xFF14181B),
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                              elevation: 0.0,
                                            ),
                                            chipSpacing: 12.0,
                                            rowSpacing: 24.0,
                                            multiselect: false,
                                            initialized:
                                                _model.choiceChipsValue1 !=
                                                    null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .choiceChipsValueController1 ??=
                                                FormFieldController<
                                                    List<String>>(
                                              [
                                                NoAuthGroup.productsCall
                                                            .size(
                                                              itemProductsResponse
                                                                  .jsonBody,
                                                            )
                                                            .length ==
                                                        1
                                                    ? 'One Size Fits All'
                                                    : '1'
                                              ],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 45.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.varToCart =
                                            await AddCartCall.call(
                                          prodId: getJsonField(
                                            itemProductsResponse.jsonBody,
                                            r'''$.product.id''',
                                          ).toString(),
                                          quantity:
                                              _model.countControllerValue1,
                                          size: _model.choiceChipsValue1,
                                          authToken: FFAppState().Token,
                                        );
                                        if (getJsonField(
                                              (_model.varToCart?.jsonBody ??
                                                  ''),
                                              r'''$.message''',
                                            ) ==
                                            null) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please Select  a Size',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              backgroundColor:
                                                  Color(0xFFBF5DE5),
                                            ),
                                          );
                                        } else {
                                          if ((_model.varToCart?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.varToCart
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                backgroundColor:
                                                    Color(0xFFBF5DE5),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .clearSnackBars();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  getJsonField(
                                                    (_model.varToCart
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.message''',
                                                  ).toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 1000),
                                                backgroundColor:
                                                    Color(0xFFBF5DE5),
                                              ),
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'Add to Cart',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF6F0691),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.58,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: Builder(
                                          builder: (context) {
                                            final img =
                                                (NoAuthGroup.productsCall.img(
                                                      itemProductsResponse
                                                          .jsonBody,
                                                    ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.toList() ??
                                                    [];
                                            return Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.58,
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 20.0),
                                                    child: PageView.builder(
                                                      controller: _model
                                                              .pageViewController2 ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  0,
                                                                  img.length -
                                                                      1)),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: img.length,
                                                      itemBuilder:
                                                          (context, imgIndex) {
                                                        final imgItem =
                                                            img[imgIndex];
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.network(
                                                            imgItem,
                                                            width: 300.0,
                                                            height: 190.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: smooth_page_indicator
                                                          .SmoothPageIndicator(
                                                        controller: _model
                                                                .pageViewController2 ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    img.length -
                                                                        1)),
                                                        count: img.length,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        onDotClicked:
                                                            (i) async {
                                                          await _model
                                                              .pageViewController2!
                                                              .animateToPage(
                                                            i,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        effect: smooth_page_indicator
                                                            .ExpandingDotsEffect(
                                                          expansionFactor: 3.0,
                                                          spacing: 8.0,
                                                          radius: 16.0,
                                                          dotWidth: 16.0,
                                                          dotHeight: 8.0,
                                                          dotColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          activeDotColor:
                                                              Color(0xFF6F0691),
                                                          paintStyle:
                                                              PaintingStyle
                                                                  .fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.favorite_border,
                                                        color:
                                                            Color(0xFF6F0691),
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.addToFavorites =
                                                            await AddFavoritesCall
                                                                .call(
                                                          prodId: widget.prodId
                                                              ?.toString(),
                                                          authToken:
                                                              FFAppState()
                                                                  .Token,
                                                        );
                                                        if ((_model
                                                                .addToFavorites
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  itemProductsResponse
                                                                      .jsonBody,
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFBF5DE5),
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  itemProductsResponse
                                                                      .jsonBody,
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      1350),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xE3BF5DE5),
                                                            ),
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          NoAuthGroup.productsCall
                                              .brandName(
                                                itemProductsResponse.jsonBody,
                                              )
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFFC777D9),
                                                fontSize: 18.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    NoAuthGroup.productsCall
                                        .prodName(
                                          itemProductsResponse.jsonBody,
                                        )
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF0F1113),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            NoAuthGroup.productsCall
                                                .price(
                                                  itemProductsResponse.jsonBody,
                                                )
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Text(
                                            'LE',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 156.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? Color(0xFF57636C)
                                                : Color(0xFFE0E3E7),
                                            size: 18.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? Color(0xFF0F1113)
                                                : Color(0xFFE0E3E7),
                                            size: 18.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFF0F1113),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          count: _model
                                              .countControllerValue2 ??= 1,
                                          updateCount: (count) => setState(() =>
                                              _model.countControllerValue2 =
                                                  count),
                                          stepSize: 1,
                                          minimum: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (NoAuthGroup.productsCall
                                        .desc(
                                          itemProductsResponse.jsonBody,
                                        )
                                        .toString() ==
                                    '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 10.0, 24.0, 5.0),
                                    child: Text(
                                      NoAuthGroup.productsCall
                                          .desc(
                                            itemProductsResponse.jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF027242),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 16.0, 0.0),
                                  child: Text(
                                    'Avilable Sizes:',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 32.0),
                                          child: FlutterFlowChoiceChips(
                                            options: [
                                              ChipData('Not Available For Now')
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.choiceChipsValue2 =
                                                    val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                              iconColor: Colors.white,
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Color(0xFFE0E3E7),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              iconColor: Color(0xFF14181B),
                                              iconSize: 18.0,
                                              labelPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 4.0, 12.0, 4.0),
                                              elevation: 0.0,
                                            ),
                                            chipSpacing: 12.0,
                                            rowSpacing: 24.0,
                                            multiselect: false,
                                            initialized:
                                                _model.choiceChipsValue2 !=
                                                    null,
                                            alignment: WrapAlignment.start,
                                            controller: _model
                                                    .choiceChipsValueController2 ??=
                                                FormFieldController<
                                                    List<String>>(
                                              ['Not Available For Now'],
                                            ),
                                            wrapped: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: _model.choiceChipsValue2 ==
                                              'Not Available'
                                          ? null
                                          : () {
                                              print('Button pressed ...');
                                            },
                                      text: 'Add to Cart',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF6F0691),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        disabledColor: Color(0xBCECBCFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
