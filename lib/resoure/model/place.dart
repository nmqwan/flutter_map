class Place{
  String _name,_addrs;
  double _lat,_lng;

  Place(this._name, this._addrs, this._lat, this._lng);

  get lng => _lng;

  set lng(value) {
    _lng = value;
  }

  double get lat => _lat;

  set lat(double value) {
    _lat = value;
  }

  get addrs => _addrs;

  set addrs(value) {
    _addrs = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Place{_name: $_name, _addrs: $_addrs, _lat: $_lat, _lng: $_lng}';
  }

  static List<Place> formatJson(Map<String,dynamic> json){
    List<Place> rs = new List<Place>();
    var result = json['results'] as List;
    print('modelPlace : '+json.toString());
    for(var item in result){
      Place placeItem =new Place(
          item['name'],
          item['formatted_address'],
          item['geometry']['location']['lat'],
          item['geometry']['location']['lng']);
      rs.add(placeItem);
    }
    return rs;
  }
}