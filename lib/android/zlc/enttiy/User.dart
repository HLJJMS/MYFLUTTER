class User {
  String _code;
  String _msg;
  Data _data;

  User({String code, String msg, Data data}) {
    this._code = code;
    this._msg = msg;
    this._data = data;
  }

  String get code => _code;
  set code(String code) => _code = code;
  String get msg => _msg;
  set msg(String msg) => _msg = msg;
  Data get data => _data;
  set data(Data data) => _data = data;

  User.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _msg = json['msg'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['msg'] = this._msg;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  String _nickName;
  String _userId;
  String _token;
  String _tokenExpire;
  String _refreshToken;
  String _refreshTokenExpire;
  int _isRegister;
  String _registerMsg;
  int _isAuthCodeCorrect;
  String _authCodeMsg;

  Data(
      {String nickName,
        String userId,
        String token,
        String tokenExpire,
        String refreshToken,
        String refreshTokenExpire,
        int isRegister,
        String registerMsg,
        int isAuthCodeCorrect,
        String authCodeMsg}) {
    this._nickName = nickName;
    this._userId = userId;
    this._token = token;
    this._tokenExpire = tokenExpire;
    this._refreshToken = refreshToken;
    this._refreshTokenExpire = refreshTokenExpire;
    this._isRegister = isRegister;
    this._registerMsg = registerMsg;
    this._isAuthCodeCorrect = isAuthCodeCorrect;
    this._authCodeMsg = authCodeMsg;
  }

  String get nickName => _nickName;
  set nickName(String nickName) => _nickName = nickName;
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get token => _token;
  set token(String token) => _token = token;
  String get tokenExpire => _tokenExpire;
  set tokenExpire(String tokenExpire) => _tokenExpire = tokenExpire;
  String get refreshToken => _refreshToken;
  set refreshToken(String refreshToken) => _refreshToken = refreshToken;
  String get refreshTokenExpire => _refreshTokenExpire;
  set refreshTokenExpire(String refreshTokenExpire) =>
      _refreshTokenExpire = refreshTokenExpire;
  int get isRegister => _isRegister;
  set isRegister(int isRegister) => _isRegister = isRegister;
  String get registerMsg => _registerMsg;
  set registerMsg(Null registerMsg) => _registerMsg = registerMsg;
  int get isAuthCodeCorrect => _isAuthCodeCorrect;
  set isAuthCodeCorrect(int isAuthCodeCorrect) =>
      _isAuthCodeCorrect = isAuthCodeCorrect;
  String get authCodeMsg => _authCodeMsg;
  set authCodeMsg(Null authCodeMsg) => _authCodeMsg = authCodeMsg;

  Data.fromJson(Map<String, dynamic> json) {
    _nickName = json['nickName'];
    _userId = json['userId'];
    _token = json['token'];
    _tokenExpire = json['tokenExpire'];
    _refreshToken = json['refreshToken'];
    _refreshTokenExpire = json['refreshTokenExpire'];
    _isRegister = json['isRegister'];
    _registerMsg = json['registerMsg'];
    _isAuthCodeCorrect = json['isAuthCodeCorrect'];
    _authCodeMsg = json['authCodeMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickName'] = this._nickName;
    data['userId'] = this._userId;
    data['token'] = this._token;
    data['tokenExpire'] = this._tokenExpire;
    data['refreshToken'] = this._refreshToken;
    data['refreshTokenExpire'] = this._refreshTokenExpire;
    data['isRegister'] = this._isRegister;
    data['registerMsg'] = this._registerMsg;
    data['isAuthCodeCorrect'] = this._isAuthCodeCorrect;
    data['authCodeMsg'] = this._authCodeMsg;
    return data;
  }
}
