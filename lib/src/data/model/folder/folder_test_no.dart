// ignore_for_file: public_member_api_docs, sort_constructors_first
class TestNoMap {
  String? name;
  String? id;
  TestNoMap({
    this.name,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  TestNoMap.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}

//  [
//   {
//     "name"= "System Management",
//     "id": "7f3eced9-5505-498b-9c95-85c33919d5ff"
//   },
//   {
//     "name": "Task Management",
//     "id": "7d0a684e-86f6-467d-ae04-aab2470f17c2"
//   }
// ]