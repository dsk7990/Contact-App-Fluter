/// msg : "Product List."
/// status : 1
/// driver_status : "1"
/// data : [{"product_id":"5","user_id":"45","product_desc":"","product_lenght":"11","product_width":"22","product_height":"33","product_weight":"44","from_address":"6650 Chemin de la Côte-Saint-Luc, Montreal, QC, Canada","from_latitude":"45.4701937","from_longitide":"-73.6493483","to_address":"3166 Avenue Lacombe, Montréal, QC H3T 1L7, Canada","to_latitude":"45.49997105421701","to_longitude":"-73.62004727125168","offer_shipping_price":"0.00","from_appt_no":"111","from_entrance":"","to_appt_no":"","to_entrance":"","comments":"","expire_date":"03-26-2020","distance":"4.022385781146851","bid_count":"0","bidding_amount":null},{"product_id":"31","user_id":"46","product_desc":"","product_lenght":"1","product_width":"2","product_height":"3","product_weight":"4","from_address":"6600 Chemin de la Côte-de-Liesse, Montréal, QC H4T 1E3, Canada","from_latitude":"45.48406625","from_longitide":"-73.69268904","to_address":"246 Avenue Tulip, Dorval, QC H9S 3P3, Canada","to_latitude":"45.44264132998113","to_longitude":"-73.73296961188316","offer_shipping_price":"0.00","from_appt_no":"","from_entrance":"","to_appt_no":"","to_entrance":"","comments":"2eerrr","expire_date":"03-26-2020","distance":"5.575206839533866","bid_count":"0","bidding_amount":"63.58"},{"product_id":"32","user_id":"46","product_desc":"","product_lenght":"10","product_width":"20","product_height":"30","product_weight":"48","from_address":"6652 Chemin de la Côte-de-Liesse, Saint-Laurent, QC H4T 1S7, Canada","from_latitude":"45.483792154886196","from_longitide":"-73.69305297732353","to_address":"9725 Rue de Lille, Montréal, QC H2B 2P6, Canada","to_latitude":"45.57162243651135","to_longitude":"-73.64163368940353","offer_shipping_price":"0.00","from_appt_no":"101","from_entrance":"300","to_appt_no":"","to_entrance":"","comments":"","expire_date":"03-28-2020","distance":"10.555269889501197","bid_count":"0","bidding_amount":null},{"product_id":"4","user_id":"40","product_desc":"","product_lenght":"12","product_width":"21","product_height":"1","product_weight":"2","from_address":"1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA","from_latitude":"37.421998333333335","from_longitide":"-122.08400000000002","to_address":"Google Building 43, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA","to_latitude":"37.4218804977236","to_longitude":"-122.08384428173305","offer_shipping_price":"0.00","from_appt_no":"","from_entrance":"","to_appt_no":"","to_entrance":"","comments":"TEST","expire_date":"03-31-2020","distance":"0.01899326457959727","bid_count":"0","bidding_amount":"10.70"}]

class T {
  String _msg;
  int _status;
  String _driverStatus;
  List<DataBean> _data;

  String get msg => _msg;
  int get status => _status;
  String get driverStatus => _driverStatus;
  List<DataBean> get data => _data;

  T(this._msg, this._status, this._driverStatus, this._data);

  T.map(dynamic obj) {
    this._msg = obj["msg"];
    this._status = obj["status"];
    this._driverStatus = obj["driverStatus"];
    this._data = obj["data"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["msg"] = _msg;
    map["status"] = _status;
    map["driverStatus"] = _driverStatus;
    map["data"] = _data;
    return map;
  }

}

/// product_id : "5"
/// user_id : "45"
/// product_desc : ""
/// product_lenght : "11"
/// product_width : "22"
/// product_height : "33"
/// product_weight : "44"
/// from_address : "6650 Chemin de la Côte-Saint-Luc, Montreal, QC, Canada"
/// from_latitude : "45.4701937"
/// from_longitide : "-73.6493483"
/// to_address : "3166 Avenue Lacombe, Montréal, QC H3T 1L7, Canada"
/// to_latitude : "45.49997105421701"
/// to_longitude : "-73.62004727125168"
/// offer_shipping_price : "0.00"
/// from_appt_no : "111"
/// from_entrance : ""
/// to_appt_no : ""
/// to_entrance : ""
/// comments : ""
/// expire_date : "03-26-2020"
/// distance : "4.022385781146851"
/// bid_count : "0"
/// bidding_amount : null

class DataBean {
  String _productId;
  String _userId;
  String _productDesc;
  String _productLenght;
  String _productWidth;
  String _productHeight;
  String _productWeight;
  String _fromAddress;
  String _fromLatitude;
  String _fromLongitide;
  String _toAddress;
  String _toLatitude;
  String _toLongitude;
  String _offerShippingPrice;
  String _fromApptNo;
  String _fromEntrance;
  String _toApptNo;
  String _toEntrance;
  String _comments;
  String _expireDate;
  String _distance;
  String _bidCount;
  dynamic _biddingAmount;

  String get productId => _productId;
  String get userId => _userId;
  String get productDesc => _productDesc;
  String get productLenght => _productLenght;
  String get productWidth => _productWidth;
  String get productHeight => _productHeight;
  String get productWeight => _productWeight;
  String get fromAddress => _fromAddress;
  String get fromLatitude => _fromLatitude;
  String get fromLongitide => _fromLongitide;
  String get toAddress => _toAddress;
  String get toLatitude => _toLatitude;
  String get toLongitude => _toLongitude;
  String get offerShippingPrice => _offerShippingPrice;
  String get fromApptNo => _fromApptNo;
  String get fromEntrance => _fromEntrance;
  String get toApptNo => _toApptNo;
  String get toEntrance => _toEntrance;
  String get comments => _comments;
  String get expireDate => _expireDate;
  String get distance => _distance;
  String get bidCount => _bidCount;
  dynamic get biddingAmount => _biddingAmount;

  DataBean(this._productId, this._userId, this._productDesc, this._productLenght, this._productWidth, this._productHeight, this._productWeight, this._fromAddress, this._fromLatitude, this._fromLongitide, this._toAddress, this._toLatitude, this._toLongitude, this._offerShippingPrice, this._fromApptNo, this._fromEntrance, this._toApptNo, this._toEntrance, this._comments, this._expireDate, this._distance, this._bidCount, this._biddingAmount);

  DataBean.map(dynamic obj) {
    this._productId = obj["productId"];
    this._userId = obj["userId"];
    this._productDesc = obj["productDesc"];
    this._productLenght = obj["productLenght"];
    this._productWidth = obj["productWidth"];
    this._productHeight = obj["productHeight"];
    this._productWeight = obj["productWeight"];
    this._fromAddress = obj["fromAddress"];
    this._fromLatitude = obj["fromLatitude"];
    this._fromLongitide = obj["fromLongitide"];
    this._toAddress = obj["toAddress"];
    this._toLatitude = obj["toLatitude"];
    this._toLongitude = obj["toLongitude"];
    this._offerShippingPrice = obj["offerShippingPrice"];
    this._fromApptNo = obj["fromApptNo"];
    this._fromEntrance = obj["fromEntrance"];
    this._toApptNo = obj["toApptNo"];
    this._toEntrance = obj["toEntrance"];
    this._comments = obj["comments"];
    this._expireDate = obj["expireDate"];
    this._distance = obj["distance"];
    this._bidCount = obj["bidCount"];
    this._biddingAmount = obj["biddingAmount"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["productId"] = _productId;
    map["userId"] = _userId;
    map["productDesc"] = _productDesc;
    map["productLenght"] = _productLenght;
    map["productWidth"] = _productWidth;
    map["productHeight"] = _productHeight;
    map["productWeight"] = _productWeight;
    map["fromAddress"] = _fromAddress;
    map["fromLatitude"] = _fromLatitude;
    map["fromLongitide"] = _fromLongitide;
    map["toAddress"] = _toAddress;
    map["toLatitude"] = _toLatitude;
    map["toLongitude"] = _toLongitude;
    map["offerShippingPrice"] = _offerShippingPrice;
    map["fromApptNo"] = _fromApptNo;
    map["fromEntrance"] = _fromEntrance;
    map["toApptNo"] = _toApptNo;
    map["toEntrance"] = _toEntrance;
    map["comments"] = _comments;
    map["expireDate"] = _expireDate;
    map["distance"] = _distance;
    map["bidCount"] = _bidCount;
    map["biddingAmount"] = _biddingAmount;
    return map;
  }

}