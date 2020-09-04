class Record {
  String name;
  String address;
  String contact;
  String photo;
  String url;

  Record(this.name, this.address, this.contact, this.photo, this.url);

  factory Record.fromJson(Map<String, dynamic> json) {
    return new Record(json['name'], json['address'], json['contact'],
        json['photo'], json['url']);
  }
}
