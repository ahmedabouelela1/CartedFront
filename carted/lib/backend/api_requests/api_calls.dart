import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start NoAuth Group Code

class NoAuthGroup {
  static String baseUrl = 'https://cartd.store/api';
  static Map<String, String> headers = {
    'Accept': 'application/json',
  };
  static BrandsCall brandsCall = BrandsCall();
  static ProductsCall productsCall = ProductsCall();
  static ProdBrandCall prodBrandCall = ProdBrandCall();
  static CatSubCall catSubCall = CatSubCall();
  static ProdCatCall prodCatCall = ProdCatCall();
  static FtBrandsCall ftBrandsCall = FtBrandsCall();
  static BestProdCall bestProdCall = BestProdCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static CheckTokenCall checkTokenCall = CheckTokenCall();
  static PasswordResetCall passwordResetCall = PasswordResetCall();
  static EssentialsCall essentialsCall = EssentialsCall();
}

class BrandsCall {
  Future<ApiCallResponse> call({
    String? brandId = '',
    String? searchBrand = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Brands',
      apiUrl: '${NoAuthGroup.baseUrl}/brands/${brandId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'filter[searchBrand]': searchBrand,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic brands(dynamic response) => getJsonField(
        response,
        r'''$.Brands''',
        true,
      );
}

class ProductsCall {
  Future<ApiCallResponse> call({
    String? prodId = '',
    String? search = '',
    String? color = '',
    String? size = '',
    String? sort = '',
    String? authToken = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Products',
      apiUrl: '${NoAuthGroup.baseUrl}/products/${prodId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'filter[search]': search,
        'filter[ByColor]': color,
        'filter[BySize]': size,
        'sort': sort,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
  dynamic prod(dynamic response) => getJsonField(
        response,
        r'''$.product''',
      );
  dynamic prodName(dynamic response) => getJsonField(
        response,
        r'''$.product.prod_name''',
      );
  dynamic brandName(dynamic response) => getJsonField(
        response,
        r'''$.product.brand.brand_name''',
      );
  dynamic desc(dynamic response) => getJsonField(
        response,
        r'''$.product.desc''',
      );
  dynamic price(dynamic response) => getJsonField(
        response,
        r'''$.product.price''',
      );
  dynamic img(dynamic response) => getJsonField(
        response,
        r'''$.product.product_images''',
        true,
      );
  dynamic size(dynamic response) => getJsonField(
        response,
        r'''$.product.variations[:].attributes.size''',
        true,
      );
  dynamic color(dynamic response) => getJsonField(
        response,
        r'''$.product.variations[:].attributes.color''',
        true,
      );
  dynamic isFav(dynamic response) => getJsonField(
        response,
        r'''$.product.is_fav''',
      );
  dynamic onSale(dynamic response) => getJsonField(
        response,
        r'''$.product.on_sale''',
      );
  dynamic percentage(dynamic response) => getJsonField(
        response,
        r'''$.product.percentage''',
      );
  dynamic newPrice(dynamic response) => getJsonField(
        response,
        r'''$.product.new_price''',
      );
}

class ProdBrandCall {
  Future<ApiCallResponse> call({
    int? brandId,
    String? search = '',
    String? color = '',
    String? size = '',
    String? sort = '',
    String? authToken = '',
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProdBrand',
      apiUrl: '${NoAuthGroup.baseUrl}/brands/${brandId}/products',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'filter[search]': search,
        'filter[ByColor]': color,
        'filter[BySize]': size,
        'sort': sort,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
}

class CatSubCall {
  Future<ApiCallResponse> call({
    int? sex,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CatSub',
      apiUrl: '${NoAuthGroup.baseUrl}/catSub/${sex}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic subCat(dynamic response) => getJsonField(
        response,
        r'''$.SubCat''',
        true,
      );
}

class ProdCatCall {
  Future<ApiCallResponse> call({
    int? catId,
    String? search = '',
    String? color = '',
    String? size = '',
    String? sort = '',
    String? authToken = '',
    int? sex,
    int? page,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ProdCat',
      apiUrl: '${NoAuthGroup.baseUrl}/categories/${catId}/${sex}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'filter[search]': search,
        'filter[ByColor]': color,
        'filter[BySize]': size,
        'sort': sort,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      );
}

class FtBrandsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'FtBrands',
      apiUrl: '${NoAuthGroup.baseUrl}/brands-featured',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ftBrands(dynamic response) => getJsonField(
        response,
        r'''$.FeaturedBrands''',
        true,
      );
}

class BestProdCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BestProd',
      apiUrl: '${NoAuthGroup.baseUrl}/products-best',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic bestProduct(dynamic response) => getJsonField(
        response,
        r'''$.BestProd''',
        true,
      );
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: '${NoAuthGroup.baseUrl}/forgot-password',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckTokenCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check Token',
      apiUrl: '${NoAuthGroup.baseUrl}/checkToken',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'email': email,
        'token': token,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PasswordResetCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Password Reset',
      apiUrl: '${NoAuthGroup.baseUrl}/resetPass',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'email': email,
        'token': token,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EssentialsCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Essentials',
      apiUrl: '${NoAuthGroup.baseUrl}/catEssentials',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic essentials(dynamic response) => getJsonField(
        response,
        r'''$.message''',
        true,
      );
}

/// End NoAuth Group Code

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? password = '',
    String? passwordConfirmation = '',
    String? phoneNum = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: 'https://cartd.store/api/register',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
        'phone_num': phoneNum,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://cartd.store/api/login',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'email': email,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class AddCartCall {
  static Future<ApiCallResponse> call({
    String? prodId = '',
    int? quantity,
    String? authToken = '',
    String? size = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddCart',
      apiUrl: 'https://cartd.store/api/cart/${prodId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {
        'quantity': quantity,
        'size': size,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CartCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Cart',
      apiUrl: 'https://cartd.store/api/cart',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cart(dynamic response) => getJsonField(
        response,
        r'''$.cart''',
        true,
      );
}

class DeleteCartCall {
  static Future<ApiCallResponse> call({
    String? varId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteCart',
      apiUrl: 'https://cartd.store/api/cart/${varId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FavoritesCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Favorites',
      apiUrl: 'https://cartd.store/api/wishlist',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic fav(dynamic response) => getJsonField(
        response,
        r'''$.wishlist''',
        true,
      );
  static dynamic prodId(dynamic response) => getJsonField(
        response,
        r'''$.wishlist[:].prod_id''',
        true,
      );
}

class DeleteFavoritesCall {
  static Future<ApiCallResponse> call({
    String? prodId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteFavorites',
      apiUrl: 'https://cartd.store/api/wishlist/${prodId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User',
      apiUrl: 'https://cartd.store/api/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
}

class AddressCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? addId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Address',
      apiUrl: 'https://cartd.store/api/address/${addId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.addresses''',
        true,
      );
  static dynamic test(dynamic response) => getJsonField(
        response,
        r'''$.addresses[:].user_id''',
        true,
      );
}

class AddAddressCall {
  static Future<ApiCallResponse> call({
    String? fullAddress = '',
    String? city = '',
    String? building = '',
    String? apartment = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddAddress',
      apiUrl: 'https://cartd.store/api/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {
        'full_address': fullAddress,
        'city': city,
        'building': building,
        'apartment': apartment,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteAddCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? addId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteAdd',
      apiUrl: 'https://cartd.store/api/address/${addId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddFavoritesCall {
  static Future<ApiCallResponse> call({
    String? prodId = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddFavorites',
      apiUrl: 'https://cartd.store/api/wishlist/${prodId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StartOrderCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? addId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'StartOrder',
      apiUrl: 'https://cartd.store/api/startOrder/${addId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.total''',
      );
  static dynamic fullAdd(dynamic response) => getJsonField(
        response,
        r'''$.address.full_address''',
      );
  static dynamic building(dynamic response) => getJsonField(
        response,
        r'''$.address.building''',
      );
  static dynamic apartment(dynamic response) => getJsonField(
        response,
        r'''$.address.apartment''',
      );
  static dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.address.city''',
      );
  static dynamic delivery(dynamic response) => getJsonField(
        response,
        r'''$.delivery''',
      );
  static dynamic sub(dynamic response) => getJsonField(
        response,
        r'''$.sub''',
      );
}

class AddOrderCall {
  static Future<ApiCallResponse> call({
    int? addId,
    String? authToken = '',
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'AddOrder',
      apiUrl: 'https://cartd.store/api/order/${addId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {
        'code': code,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrderCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Order',
      apiUrl: 'https://cartd.store/api/order',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic order(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      );
  static dynamic items(dynamic response) => getJsonField(
        response,
        r'''$.orders[:].order_items''',
        true,
      );
}

class ProfileCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Profile',
      apiUrl: 'https://cartd.store/api/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  static dynamic fName(dynamic response) => getJsonField(
        response,
        r'''$.user.first_name''',
      );
  static dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.user.last_name''',
      );
  static dynamic mail(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
  static dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.user.phone_num''',
      );
  static dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.user.gender''',
      );
}

class EditProfileCall {
  static Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? phoneNum = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'EditProfile',
      apiUrl: 'https://cartd.store/api/user',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_num': phoneNum,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApplyVoucherCall {
  static Future<ApiCallResponse> call({
    String? code = '',
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApplyVoucher',
      apiUrl: 'https://cartd.store/api/applyVoucher',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'code': code,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic oldtotal(dynamic response) => getJsonField(
        response,
        r'''$.old_total''',
      );
  static dynamic percentage(dynamic response) => getJsonField(
        response,
        r'''$.percentage''',
      );
  static dynamic total(dynamic response) => getJsonField(
        response,
        r'''$.total''',
      );
}

class UpdateFavCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    int? prodId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateFav',
      apiUrl: 'https://cartd.store/api/favorites/${prodId}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteUser',
      apiUrl: 'https://cartd.store/api/user',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CheckStockCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check Stock',
      apiUrl: 'https://cartd.store/api/cartCheck',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Accept': 'Application/json',
      },
      params: {},
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
