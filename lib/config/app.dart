import 'appearance.dart';

Map<String, dynamic> choiceByEnvironment([String env = 'development']) =>
    env == 'production' ? _production : _development;

final Map<String, dynamic> _development = {
  "env": "development",
  "userId": 1,
  "server": {
    "url": "https://jsonplaceholder.typicode.com",
  },
  "appearance": appearance,
};

final Map<String, dynamic> _production = {
  "env": "production",
  "userId": 1,
  "server": {
    "url": "https://jsonplaceholder.typicode.com",
  },
  "appearance": appearance,
};
