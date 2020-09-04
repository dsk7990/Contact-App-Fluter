import 'package:contactapp/apis/ApiManager.dart';
import 'package:contactapp/models/signin/SignInResponse.dart';
import 'package:contactapp/utils/logger.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'helpers/Constants.dart';

ProgressDialog pr;

class LoginScreen extends StatelessWidget {
  final _pinCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = CircleAvatar(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: loginLogo,
      ),
      radius: bigRadius,
    );

    final pinCode = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: _pinCodeController,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          textAlign: TextAlign.center,
          maxLines: 1,
          autofocus: false,

          decoration: InputDecoration(
              hintText: "98989 89898",
              hintStyle: TextStyle(color: appPrimaryDarkGreyColor),
              contentPadding: EdgeInsets.all(10.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              )),
//          enabledBorder: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(20.0),
//              borderSide: BorderSide(color: Colors.black,width: 1))),
          style: TextStyle(
            color: Colors.black,
          ),
        ));

    final loginButton = Padding(
      padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
        padding: EdgeInsets.all(16.0),
        onPressed: () {
//          callLoginApi(context);
          Navigator.of(context).pushNamed('/HomePage');
//          Navigator.of(context).pushReplacementNamed('/LoginScreen');
        },
        color: appPrimaryDarkGreyColor,
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: appPrimaryGreyColor,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          SizedBox(
            height: bigRadius,
          ),
          logo,
          SizedBox(
            height: bigRadius,
          ),
          pinCode,
          loginButton
        ],
      ),
    );
  }

  Future<void> callLoginApi(BuildContext context) async {
//    Map<String, dynamic> map = new HashMap();
//    map['user_password'] = "123";
//    map['user_mobile'] = "9638038525";
//    map['device_id'] = "23123123";
//    map['device_token'] = "96380123213138525";
//    map['device_type'] = "android";
//    Map<String, dynamic> dataMap = new HashMap();
//    dataMap['data'] = map;
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);
    await pr.show();

    Map<String, dynamic> map = {
      'user_password': 'xxx',
      'user_mobile': 'xxx',
      'device_id': 'xxx',
      'device_token': 'xxx',
    };

    Map<String, dynamic> mapData = {
      'data': map,
    };

    ApiManager.init();
    SignInResponse signInResponse = await ApiManager.loginApi(mapData);
    if (signInResponse.success == '1') {}
    Fluttertoast.showToast(
        msg: signInResponse.message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIos: 1);
    Logger.print(signInResponse.success);
    pr.hide();
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  Future<String> _getDeviceId1(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}
