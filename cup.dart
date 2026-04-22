class Cup {
  int tea = 100;
  
  void pit() {
    if (tea >= 10) {
      tea -= 10;
      print('*Глоток* Осталось $tea мл');
    } else {
      print('Кружка пустая');
    }
  }
}


class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void pitIzCup(Cup C) {
    print('$name ($age лет) пьёт');

    var c = Cup();
    print(c.tea);
  }
}
void main() {
  var c = Cup();
  var pers = Person('Ванитта', 18);
  pers.pitIzCup(c);
  pers.pitIzCup(c);
  pers.pitIzCup(c);
}
//2.
class Shelf {
  Map<String, String> _things = {};
  
  void put(String key, String value) {
    _things [key] = value;
    print('"$value" положена на полку под ключом "$key"');
  }
  
  String? take(String key) {
    if (_things.containsKey(key)) {
      String value = _things[key]!;
      _things.remove(key);
      print('"$value" взята с полки');
      return value;
    } else {
      print('На полке нет вещей с ключом "$key" ');
      return null;
    }
  }
  
  void showVse() {
    print("На полке: $_things");
  }
}

class Shkaf {
  List<Shelf> _Shelfs = [];
  
  void addShelf(Shelf p) {
    _Shelfs.add(p);
    print("Полка добавлена в шкаф. Всего полок: ${_Shelfs.length}");
  }
  
  void puttinShkaf(int index, String key, String value) {
    if (index < _Shelfs.length) {
      _Shelfs[index].put(key, value);
    } else {
      print(" полки $index не существует");
    }
  }
  
  String? takefromShkafa(int index, String key) {
    if (index < _Shelfs.length) {
      return _Shelfs[index].take(key);
    } else {
      print("полки $index не существует");
      return null;
    }
  }
}
void main1(){
  var shelf1 = Shelf();
  var shelf2 = Shelf();
  var shkaf = Shkaf();
  shkaf.addShelf(shelf1);
  shkaf.addShelf(shelf2);
  shkaf.puttinShkaf(0, 'Книга', 'Бедная Лиза');
  shkaf.puttinShkaf(1, 'журнал', 'Мурзилка');
  shkaf.takefromShkafa(0, 'Книга');
  shkaf.takefromShkafa(0, 'Книга');
}
//3.
class Blin {
  double _ves;
  
  Blin(this._ves);
  
  double get ves => _ves;
  
  void info() => print("Блин весом $_ves кг");
}

class Grif {
  double _maxVes;
  double _tekushiyVes = 0;
  List<Blin> _leftStorona = [];
  List<Blin> _rightStorona = [];
  
  Grif(this._maxVes);
  
  bool navesitBlin(Blin b, String storona) {
    if (_tekushiyVes + b.ves <= _maxVes) {
      if (storona == 'left') {
        _leftStorona.add(b);
      } else if (storona == 'right') {
        _rightStorona.add(b);
      } else {
        print('Ошибка: сторона должна быть "left" или "right"');
        return false;
      }
      _tekushiyVes += b.ves;
      print('Блин ${b.ves}кг навешен на $storona сторону. Общий вес: $_tekushiyVes/$_maxVes кг');
      return true;
    } else {
      print('Перегруз, слишком много! Блин ${b.ves}кг не помещается. Свободно: ${_maxVes - _tekushiyVes}кг');
      return false;
    }
  }
  
  void showVes() => print("Текущий вес: $_tekushiyVes/$_maxVes кг");
}

void main3(){
  var grif = Grif(100);
  var b1 = Blin(20);
  var b2 = Blin(25);
  var b3 = Blin(67);
  grif.navesitBlin(b1, 'left');
  grif.navesitBlin(b2, 'right');
  grif.navesitBlin(b3, 'left');
  grif.showVes();
}
// 4.
class CurrencyConverter {
  double _kurs;
  
  CurrencyConverter(this._kurs);
  
  double convert(double summa, String from, String to) {
    double result = summa * _kurs;
    print('$summa $from = $result $to (курс: 1 $from = $_kurs $to)');
    return result;
  }
  
  void setKurs(double newKurs) {
    _kurs = newKurs;
    print('Обнавлён 1 единица = $_kurs');
  }
}
void main4(){
  var conv = CurrencyConverter(90);
  conv.convert(100, 'USD', 'RUB');
  conv.setKurs(95);
  conv.convert(50, 'EUR', 'RUB');
}
// 5.
class Garaj<T> {
  List<T> _items = [];
  
  void postavit(T item) {
    _items.add(item);
    print('$item помещён в гараж');
  }
  
  T? take() {
    if (_items.isNotEmpty) {
      T item = _items.removeLast();
      print("$item взят из гаража");
      return item;
    } else {
      print("Гараж пуст");
      return null;
    }
  }
  
  void showVse() {
    print('В гараже: $_items');
  }
  
  int get count => _items.length;
}

void main5(){
  var garajString = Garaj<String>();
  garajString.postavit('BMW');
  garajString.postavit('Audi');
  garajString.postavit('Miata');
  garajString.showVse();
  garajString.take();
  garajString.showVse();

  var garajInt = Garaj<int>();
  garajInt.postavit(100);
  garajInt.postavit(300);
  garajInt.showVse();
}
//  6.
class MyNumber {
  int _value;
  
  MyNumber(this._value);
  
  int get value => _value;
  
  MyNumber operator +(MyNumber other) => MyNumber(_value + other._value);
  MyNumber operator -(MyNumber other) => MyNumber(_value - other._value);
  MyNumber operator *(MyNumber other) => MyNumber(_value * other._value);
  MyNumber operator /(MyNumber other) => MyNumber(_value ~/ other._value);
  MyNumber operator %(MyNumber other) => MyNumber(_value % other._value);
  
  @override
  String toString() => '$_value';
  
  void display() => print('Значение: $_value');
}

void main6(){
  var a = MyNumber(67);
  var b = MyNumber(8);
  print('$a + $b = ${a + b}');
  print('$a - $b = ${a - b}');
  print('$a * $b = ${a * b}');
  print('$a / $b = ${a / b}');
  print('$a % $b = ${a % b}');
}
// 7.
enum CarState { stop, drive, povorot }

class Car {
  String _model;
  CarState _state;
  
  Car(this._model) : _state = CarState.stop;
  
  void stop() {
    _state = CarState.stop;
    print('$_model остановился');
  }
  
  void ehat() {
    _state = CarState.drive;
    print('$_model едет');
  }
  
  void povernut() {
    _state = CarState.povorot;
    print('$_model поворачивает');
  }
  
  void showState() {
    print('$_model сейчас: $_state');
  }
  
  CarState get state => _state;
}

void main7(){
var auto = Car('MiataX5');
  auto.ehat();
  auto.povernut();
  auto.stop();
  auto.showState();
}
//8.
abstract class Figura {
  double ploshad();
  void info() => print('Площадь фигуры: ${ploshad()}');
}

class Pramougolnik extends Figura {
  double _a;
  double _b;
  
  Pramougolnik(this._a, this._b);
  
  @override
  double ploshad() => _a * _b;
  
  @override
  void info() => print('Прямоугольник $_a x $_b, площадь: ${ploshad()}');
}

class Treugolnik extends Figura {
  double _osnovanie;
  double _vysota;
  
  Treugolnik(this._osnovanie, this._vysota);
  
  @override
  double ploshad() => 0.5 * _osnovanie * _vysota;
  
  @override
  void info() => print('Треугольник (основание $_osnovanie, высота $_vysota), площадь: ${ploshad()}');
}

class Okruzhnost extends Figura {
  double _radius;
  
  Okruzhnost(this._radius);
  
  @override
  double ploshad() => 3.14159 * _radius * _radius;
  
  @override
  void info() => print('Окружность (радиус $_radius), площадь: ${ploshad()}');
}

void main8(){
var pr = Pramougolnik(5, 4);
  var tr = Treugolnik(6, 3);
  var okr = Okruzhnost(3);
  pr.info();
  tr.info();
  okr.info();
}

// 9.
class NumberConverter {
  String fromDecimal(int number, String system) {
    if (system == 'hex') {
      return number.toRadixString(16).toUpperCase();
    } else if (system == 'oct') {
      return number.toRadixString(8);
    } else if (system == 'bin') {
      return number.toRadixString(2);
    } else {
      return number.toString();
    }
  }
  
  int toDecimal(String number, String system) {
    if (system == 'hex') {
      return int.parse(number, radix: 16);
    } else if (system == 'oct') {
      return int.parse(number, radix: 8);
    } else if (system == 'bin') {
      return int.parse(number, radix: 2);
    } else {
      return int.parse(number);
    }
  }
  
  void convertAndPrint(int number, String from, String to) {
    print('$number в $from = ${fromDecimal(number, from)}');
  }
}

void main9(){
  var numConv = NumberConverter();
  print('16 в шестнадцатеричной: ${numConv.fromDecimal(16, 'hex')}');
  print('69 в шестнадцатеричной: ${numConv.fromDecimal(69, 'hex')}');
  print('18 в восьмеричной: ${numConv.fromDecimal(18, 'oct')}');
  print('B в десятичной: ${numConv.toDecimal('B', 'hex')}');
  
}
//10.
class FiguraList {
  List<Figura> _figures = [];
  
  void add(Figura f) {
    _figures.add(f);
    print('Фигура добавлена');
  }
  
  Figura findMaxArea() {
    if (_figures.isEmpty) {
      throw Exception('Список фигур пуст');
    }
    
    Figura maxFig = _figures[0];
    for (var fig in _figures) {
      if (fig.ploshad() > maxFig.ploshad()) {
        maxFig = fig;
      }
    }
    return maxFig;
  }
  
  void showMaxArea() {
    if (_figures.isEmpty) {
      print('Нет фигур для анализа');
      return;
    }
    Figura maxFig = findMaxArea();
    print('Фигура с максимальной площадью:');
    maxFig.info();
  }
  
  int get count => _figures.length;
}

void main10(){
  var figList = FiguraList();
  figList.add(Pramougolnik(6, 8));
  figList.add(Treugolnik(7, 12));
  figList.add(Okruzhnost(55));
  figList.showMaxArea();
}
// 11.
class Pribor {
  String _name;
  
  Pribor(this._name);
  
  String get name => _name;
  
  void info() => print('$_name на столе');
}

class Spoon extends Pribor {
  Spoon() : super('Ложка');
}

class Fork extends Pribor {
  Fork() : super('Вилка');
}

class Knife extends Pribor {
  Knife() : super('Нож');
}

class Table {
  List<Pribor> _pribory = [];
  
  void show(Pribor p) {
    _pribory.add(p);
    print('${p.name} поставили на стол');
  }
  
  void remove(Pribor p) {
    if (_pribory.remove(p)) {
      print('${p.name} убрали со стола');
    } else {
      print('Такого прибора нет на столе');
    }
  }
  
  void showVse() {
    if (_pribory.isEmpty) {
      print('На столе нет приборов');
    } else {
      print('На столе: ${_pribory.map((p) => p.name).join(', ')}');
    }
  }
  
  void removeVse() {
    _pribory.clear();
    print('Все приборы убраны со стола');
  }
}

void main11(){
  var stol = Table();
  stol.show(Spoon());
  stol.show(Fork());
  stol.show(Knife());
  stol.showVse();
  stol.remove(Fork());
  stol.showVse();
  stol.removeVse();
  stol.showVse();
}
