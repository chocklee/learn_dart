/// 工厂构造函数
/// 当执行构造函数并不总是创建这个类的一个新实例时，则使用 factory 关键字。
/// 例如，一个工厂构造函数可能会返回一个 cache 中的实例， 或者可能返回一个子类的实例

class Logger {
  final String name;
  bool mute = false;

  // 私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};

  // 工厂构造函数无法访问 this
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return (_cache[name] as Logger);
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}
