import 'dart:convert';



import 'package:shop_app/models/login_request.dart';

import 'api_provider.dart';
import 'database_helper.dart';

// final String apiUrl = "";
final String apiUrl = "http://dev.apptechegy.com/index.php?route=api";

class Repository {
  final apiProvider = ApiProvider();
//  final databaseHelper = DatabaseHelper();

  /////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////
  Repository._privateConstructor();

  static final Repository instance = Repository._privateConstructor();

  /////////////////////////////////////////////////////////////////

  Future login({LoginRequest loginRequest}) async {

    print(json.encode(loginRequest.toJson()));
    var responseData = await apiProvider.postRequestAPI(
      url: '$apiUrl/login',
      body: json.encode(loginRequest.toJson()),
    );
    return responseData;
  }
//  Future registration(RegisterationRequest registerationRequest) async {
//    var responseData = await apiProvider.postRequestAPI(
//      url: '$apiUrl/user/registration',
//      headers: {},
//      body: json.encode(registerationRequest.toJson()),
//    );
//    return User.fromJson(responseData);
//  }
  Future logout(String token, String firebaseToken) async {
    var responseData = await apiProvider.postRequestAPI(
      url: '$apiUrl/logout',
      body: json.encode({"registrationId": firebaseToken}),
    );
    return responseData;
  }



  ///////////////////////////////////////////////////////////////////

//  Future getBranches() async {
//    var responseData = await apiProvider.getRequestAPI(
//      url: '$apiUrl/Branch/Branches',
//      headers: {}
//    );
//    List<Branch> branches =new List();
//    for(dynamic branch in responseData) {
//     Branch _branch = Branch.fromJson(branch);
//     branches.add(_branch);
//    }
//    return branches;
//  }
//
//  Future getCategories(String branchUID,String departmentName,) async {
//    var responseData = await apiProvider.getRequestAPI(
//        url: '$apiUrl/Branch/$branchUID/Category/$departmentName',
//        headers: {}
//    );
//    print(responseData);
//    List<Category> categories =new List();
//    for(dynamic category in responseData) {
//      Category _category = Category.fromJson(category);
//      categories.add(_category);
//    }
//    return categories;
//  }
//
//
//  Future getItems(String branchUID,int categoryID) async {
//    var responseData = await apiProvider.getRequestAPI(
//        url: '$apiUrl/Branch/$branchUID/Items/$categoryID',
//        headers: {}
//    );
//    print(responseData);
//    List<Item> items =new List();
//    for(dynamic item in responseData) {
//      Item _item = Item.fromJson(item);
//      print(_item.itemName);
//      items.add(_item);
//    }
//    return items;
//  }
//
//  Future sendOrder(OrderRequest orderRequest) async {
//    var responseData = await apiProvider.postRequestAPI(
//        url: '$apiUrl/user/Order/newOrder/Internal',
//        headers: {},
//        body: json.encode(orderRequest.toJson()),
//    );
//    print(responseData);
//    return true;
//  }
//
//
//
//  Future getOrders(String userID) async {
//    var responseData = await apiProvider.getRequestAPI(
//        url: '$apiUrl/user/$userID/Order',
//        headers: {}
//    );
//    print(responseData);
//    List<Order> orders =new List();
//    for(dynamic order in responseData) {
//      Order _order = Order.fromJson(order);
//      orders.add(_order);
//    }
//    return orders;
//  }
//  Future getActiveOrders(String userID) async {
//    var responseData = await apiProvider.getRequestAPI(
//        url: '$apiUrl/user/Order/$userID/IsActive',
//        headers: {}
//    );
//    print(responseData);
//      Order _order = Order.fromJson(responseData);
//    return _order;
//  }
//  Future getOrderItems(int oderID) async {
//    var responseData = await apiProvider.getRequestAPI(
//        url: '$apiUrl/user/Order/$oderID/Item',
//        headers: {}
//    );
//    print(responseData);
//    List<Item> items =new List();
//    for(dynamic item in responseData) {
//      Item _item = Item.fromJson(item);
//      items.add(_item);
//    }
//    return items;
//  }
//
//
//  ////////////////////////////////////////////////////////////////////
//  Future sendCodeToPhoneNumber(String phone) async {
//    var responseData = await apiProvider.postRequestAPI(
//      url: '$apiUrl/auth/requestForgetPassword',
//      headers: {},
//      body: json.encode({"phone": phone}),
//    );
//    return responseData;
//  }
//
//  Future validateCodeToPhoneNumber(String phone, String code) async {
//    var responseData = await apiProvider.postRequestAPI(
//      url: '$apiUrl/auth/validateForgetPassword',
//      headers: {},
//      body: json.encode({"phone": phone, "token": code}),
//    );
//    return responseData;
//  }
//
//  Future changeForgetPassword(
//    String phone,
//    String code,
//    String password,
//  ) async {
//    var responseData = await apiProvider.postRequestAPI(
//      url: '$apiUrl/auth/changeForgetPassword',
//      headers: {},
//      body: json.encode({
//        "phone": phone,
//        "token": code,
//        "password": password,
//      }),
//    );
//    return responseData;
//  }
//
//  ///////////////////////////////////// data base
//  Future<int> loginOfLine({User user}) async {
//    return await databaseHelper.saveData(
//        tableName: 'User', data: user.toJson());
//  }
//
//  Future<int> updateUserLogin({User user}) async {
//    return await databaseHelper.updateData(
//        tableName: 'User', data: user.toJsonUpdate());
//  }
//
//  Future<User> getLoginUser() async {
//    Map<String, dynamic> user = await databaseHelper.getData(
//      tableName: 'User',
//      nameColumns: null,
//    );
//    if (user != null) return User.fromJson(user);
//
//    return null;
//  }
//
//  Future<int> logoutOfLine() async {
//    return await databaseHelper.deleteAllTable(tableName: 'User');
//  }
//  ////////////////////////////////////////////////////////////
////offline cart
//  Future<int> addToCart({Item cartItem}) async {
//    return await databaseHelper.addToCart(cartItem);
//  }
//  Future<int> removeFromCart({int id}) async {
//    return await databaseHelper.removeFromCart(id);
//  }
//
//  Future<List<Item>> getCartItem() async {
//    dynamic data = await databaseHelper.getCartData();
//
//    List<Item> items =new List();
//    for(dynamic item in data) {
//       Item _item = Item.fromJson(item);
//      print(_item);
//      items.add(_item);
//    }
//    return items;
//  }
//  Future<int> removeAllCart() async {
//    return await databaseHelper.deleteAllTable(tableName: 'Cart');
//  }

}
