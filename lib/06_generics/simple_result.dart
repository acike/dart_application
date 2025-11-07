/// คลาส Result แบบง่าย สำหรับเก็บค่า [value] ที่สำเร็จ (ประเภท T)
/// หรือ [error] ที่ล้มเหลว (ประเภท Object) อย่างใดอย่างหนึ่ง
class Result<T> {
  final T? _value;
  final Object? _error;
  final bool _isSuccess; // เก็บสถานะไว้เลย เพื่อง่ายต่อการ check

  // Constructor หลักเป็น private เพื่อบังคับให้สร้างผ่าน named constructors
  const Result._({T? value, Object? error, required bool isSuccess})
    : _value = value,
      _error = error,
      _isSuccess = isSuccess,
      // ตรวจสอบเงื่อนไข: ต้องมี value หรือ error อย่างใดอย่างหนึ่งเท่านั้น
      assert(
        (value != null && error == null && isSuccess) ||
            (value == null && error != null && !isSuccess),
        'Result must have either a value (and be success) or an error (and be failure).',
      );

  /// สร้าง Result ที่สำเร็จพร้อมค่า [value]
  const Result.success(T value)
    : this._(value: value, error: null, isSuccess: true);

  /// สร้าง Result ที่ล้มเหลวพร้อม [error]
  const Result.failure(Object error)
    : this._(value: null, error: error, isSuccess: false);

  /// Getter: คืนค่า true ถ้าเป็น Success (มี value)
  bool get isSuccess => _isSuccess;

  /// Getter: คืนค่า true ถ้าเป็น Failure (มี error)
  bool get isFailure => !_isSuccess;

  /// ดึงค่า value ออกมา (ควรใช้หลังจากเช็ค isSuccess แล้ว)
  /// ถ้าเป็น Failure จะ throw StateError
  T get value {
    if (!isSuccess) {
      throw StateError('Cannot access value from a Failure Result.');
    }
    // เนื่องจาก isSuccess = true แปลว่า _value ไม่ใช่ null แน่นอน
    return _value as T;
  }

  /// ดึงค่า error ออกมา (ควรใช้หลังจากเช็ค isFailure แล้ว)
  /// ถ้าเป็น Success จะ throw StateError
  Object get error {
    if (isSuccess) {
      throw StateError('Cannot access error from a Success Result.');
    }
    // เนื่องจาก isSuccess = false แปลว่า _error ไม่ใช่ null แน่นอน
    return _error!;
  }

  @override
  String toString() {
    if (isSuccess) {
      return 'Success(value: $_value)';
    } else {
      return 'Failure(error: $_error)';
    }
  }
}

// --- ตัวอย่างการใช้งาน ---
void main() {
  // ฟังก์ชันตัวอย่าง
  Result<int> safeDivide(int a, int b) {
    try {
      if (b == 0) {
        throw ArgumentError('Division by zero');
      }
      return Result.success(a ~/ b);
    } catch (e) {
      return Result.failure(e);
    }
  }

  final result1 = safeDivide(10, 2); // Success
  final result2 = safeDivide(5, 0); // Failure

  print('Result 1: $result1');
  if (result1.isSuccess) {
    print('  Success! Value is ${result1.value}');
  } else {
    print('  Failure! Error is ${result1.error}');
  }

  print('Result 2: $result2');
  if (result2.isSuccess) {
    print('  Success! Value is ${result2.value}');
  } else {
    print('  Failure! Error is ${result2.error}');
  }

  // ลองเข้าถึงค่าผิดประเภท (จะ throw error)
  try {
    print(result2.value);
  } catch (e) {
    print('  Tried accessing value on Failure: $e');
  }

  try {
    print(result1.error);
  } catch (e) {
    print('  Tried accessing error on Success: $e');
  }
}
