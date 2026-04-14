// 1) Interface (contract)
import 'package:dart_application_1/09_oop_deep_dive/ex_count.dart';

abstract class Engine {
  String get name;
  int get powerKw;
  void start();
  void stop();
}

// 2) Implementations
class GasEngine implements Engine {
  @override
  final String name;
  @override
  final int powerKw;
  GasEngine({this.name = "GasEngine", this.powerKw = 120});
  @override
  void start() => print("$name: ignition on");
  @override
  void stop() => print("$name: shut down");
}

class ElectricEngine implements Engine {
  @override
  final String name;
  @override
  final int powerKw;
  ElectricEngine({this.name = "ElectricEngine", this.powerKw = 150});
  @override
  void start() => print("$name: inverter online");
  @override
  void stop() => print("$name: high-voltage off");
}

// 3) Composition + DI
class Car {
  Engine _engine;
  Car(this._engine);

  void drive() {
    _engine.start();
    print("Car driving with ${_engine.name} (${_engine.powerKw} kW)");
  }

  void park() {
    print("Car parking…");
    _engine.stop();
  }

  // Hot-swap component safely
  void swapEngine(Engine newEngine) {
    _engine.stop();
    _engine = newEngine;
    print("Swapped to ${_engine.name}");
  }
}

// 4) Decorator: add behavior without touching engines
class LoggingEngine implements Engine {
  final Engine inner;
  LoggingEngine(this.inner);
  @override
  String get name => inner.name;
  @override
  int get powerKw => inner.powerKw;
  @override
  void start() {
    print("[LOG] start ${inner.name}");
    inner.start();
  }

  @override
  void stop() {
    print("[LOG] stop ${inner.name}");
    inner.stop();
  }
}

// 5) Adapter: wrap an incompatible third-party motor
class ThirdPartyMotor {
  final String label;
  final int watts;
  ThirdPartyMotor(this.label, this.watts);
  void powerOn() => print("$label: powerOn()");
  void powerOff() => print("$label: powerOff()");
}

class MotorAdapter implements Engine {
  final ThirdPartyMotor motor;
  MotorAdapter(this.motor);
  @override
  String get name => motor.label;
  @override
  int get powerKw => (motor.watts / 1000).round();
  @override
  void start() => motor.powerOn();
  @override
  void stop() => motor.powerOff();
}

class CountB {
  final int count;
  CountB(this.count);

  void printCount() {
    print(count);
  }
}

// 6) Demo
void main() {
  final car = Car(LoggingEngine(GasEngine(powerKw: 110)));
  car.drive();
  car.park();

  car.swapEngine(LoggingEngine(ElectricEngine(powerKw: 180)));
  car.drive();

  final adapted = LoggingEngine(
    MotorAdapter(ThirdPartyMotor("MotorX", 160000)),
  );
  car.swapEngine(adapted);
  car.drive();
  car.park();
  final countA = CountA(10);
  countA.printCount();
  final countB = CountB(20);
  countB.printCount();
  print('${countA.count}');
  print('${countB.count}');
}
