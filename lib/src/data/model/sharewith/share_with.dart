import 'value_share_with.dart';

class SharedWith {
  int? id;
  String? type;
  String? scope;
  ValueShareWith? value;
  String? expiration;
  SharedWith({
    this.id,
    this.type,
    this.scope,
    this.value,
    this.expiration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'scope': scope,
      'value': value?.toMap(),
      'expiration': expiration
    };
  }

  factory SharedWith.fromMap(Map<String, dynamic> map) {
    return SharedWith(
      id: map['id'],
      type: map['type'],
      scope: map['scope'],
      value: ValueShareWith.fromMap(map['value']),
      expiration:
          map['expiration'] != null ? map['expiration'] as String : null,
    );
  }
}
