// enum Status {
//   alive(name: 'alive'),
//   dead(name: 'dead'),
//   unknown(name: 'unknown');

//   final String name;

//   const Status({required this.name});
// }

// enum Gender {
//   female(name: 'female'),
//   male(name: 'male'),
//   genderless(name: 'genderless'),
//   unknown(name: 'unknown');

//   final String name;

//   const Gender({required this.name});
// }

class Status {
  final String name;

  const Status._(this.name);

  static const alive = Status._('alive');
  static const dead = Status._('dead');
  static const unknown = Status._('unknown');

  static const List<Status> values = [alive, dead, unknown];
}

class Gender {
  final String name;

  const Gender._(this.name);

  static const female = Gender._('female');
  static const male = Gender._('male');
  static const genderless = Gender._('genderless');
  static const unknown = Gender._('unknown');

  static const List<Gender> values = [female, male, genderless, unknown];
}
