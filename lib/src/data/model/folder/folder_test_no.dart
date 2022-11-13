// ignore_for_file: public_member_api_docs, sort_constructors_first
class TestNoMap {
  String? name;
  String? id;
  TestNoMap({
    this.name,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory TestNoMap.fromMap(Map<String, dynamic> map) {
    return TestNoMap(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }
}

//  [
//   {
//     "name": "System Management",
//     "id": "7f3eced9-5505-498b-9c95-85c33919d5ff"
//   },
//   {
//     "name": "Task Management",
//     "id": "7d0a684e-86f6-467d-ae04-aab2470f17c2"
//   }
// ]