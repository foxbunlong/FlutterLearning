class User {
  String _username;
  String _password;
  int _id;

  User(this._username, this._password);

  // dynamic = Any
  User.map(dynamic object) {
    this._username = object["username"];
    this._password = object["password"];
    this._id = object["id"];
  }

  String get password => _password;
  String get username => _username;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["username"] = _username;
    map["password"] = _password;

    if (id != null) {
      map["id"] = _id;
    }

    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._username = map["username"];
    this._password = map["password"];
    this._id = map["id"];
  }

}