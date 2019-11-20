class OrderRequest {
  int _id;
  String _description;
  String _date;
  bool _submitted;
  bool _recurrent;

//named constructor
  OrderRequest.withId(this._id, this._description, this._date, this._submitted,
      this._recurrent);

  OrderRequest(this._description, this._date, this._submitted, this._recurrent);

  ///
  ///getter
  int get id => _id;
  String get description => _description;
  String get date => _date;
  bool get recurrent => _recurrent;
  bool get submitted => _submitted;

  set description(String desc) {
    if (desc.length < 255) {
      this._description = desc;
    }
  }

  set date(String dt) {
    this._date = dt;
  }

  set recurrent(bool rec) {
    this._recurrent = rec;
  }

  set submitted(bool sub) {
    this._submitted = sub;
  }

  ///convert object to map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) map["id"] = _id;
    map["description"] = _description;
    map["date"] = _date;
    map["recurrent"] = _recurrent;
    map["submitted"] = _submitted;

    return map;
  }

  OrderRequest.fromMapObject(Map<String, dynamic> map) {
    this._id = map["id"];
    this._description = map["description"];
    this._date = map["date"];
    this._recurrent = map["recurrent"];
    this._submitted = map["submitted"];
  }
}
