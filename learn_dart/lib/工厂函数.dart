abstract class Phone {
  void call();
  factory Phone(String type) {
    switch (type) {
      case 'Android':
        return AndroidPhone();
      case 'iOS':
        return IPhone();
      default:
        throw "The '$type' phone is not supported";
    }
  }
}

class AndroidPhone implements Phone {
  @override
  void call() {
    print('Android phone call');
  }
}

class IPhone implements Phone {
  @override
  void call() {
    print('IPhone call');
  }
}

// 单例模式
class PhoneSignleton {
  static final PhoneSignleton _instance = PhoneSignleton._internal();
  PhoneSignleton._internal();

  factory PhoneSignleton() {
    return _instance;
  }

  void call() {
    print('PhoneSignleton call');
  }
}

// 减少重复实例对象
class APhone {
  int _number;
  APhone(this._number);

  factory APhone.formJson(Map<String, dynamic> json) =>
      APhone(json['number'] as int);

  void call() {
    print('Calling $_number');
  }
}

void main() {
  var android = Phone('Android');
  var iOS = Phone('iOS');
  android.call();
  iOS.call();

  var phone1 = PhoneSignleton();
  var phone2 = PhoneSignleton();
  print(identical(phone1, phone2)); // true
  PhoneSignleton().call();

  var phone3 = APhone.formJson({'number': 123});
  phone3.call();
}
