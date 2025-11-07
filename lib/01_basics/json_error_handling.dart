// เทคนิค Error Handling สำหรับ JSON ที่ซับซ้อน
void main() {
  print('🛡️ Error Handling สำหรับ JSON ที่ซับซ้อน\n');

  // ตัวอย่าง JSON ที่อาจมีข้อมูลขาดหาย
  final Map<String, dynamic> incompleteData = {
    'user': {
      'id': '12345',
      'profile': {
        'firstName': 'สมชาย',
        // 'lastName': null, // ข้อมูลหาย!
        // 'avatar': null,    // ข้อมูลหาย!
      },
      'social': {
        'followers': null, // ข้อมูลหาย!
        'posts': [], // Array ว่าง!
      },
    },
  };

  print('1. การจัดการข้อมูลหาย:');
  safeDataAccess(incompleteData);

  print('\n${'=' * 50}\n');

  print('2. การตรวจสอบประเภทข้อมูล:');
  dataTypeValidation();

  print('\n${'=' * 50}\n');

  print('3. การจัดการ API Response ที่ผิดพลาด:');
  handleApiErrors();
}

// 1. วิธีเข้าถึงข้อมูลอย่างปลอดภัย
void safeDataAccess(Map<String, dynamic> data) {
  // ❌ วิธีที่อันตราย - อาจ error
  // final String lastName = data['user']['profile']['lastName']; // Error!

  // ✅ วิธีที่ปลอดภัย - ใช้ null-aware operators
  final String? firstName = data['user']?['profile']?['firstName'];
  final String? lastName = data['user']?['profile']?['lastName'];
  final String? avatar = data['user']?['profile']?['avatar'];
  final int? followers = data['user']?['social']?['followers'];

  print('ชื่อ: ${firstName ?? "ไม่มีข้อมูล"}');
  print('นามสกุล: ${lastName ?? "ไม่มีข้อมูล"}');
  print('รูปโปรไฟล์: ${avatar ?? "ไม่มีรูป"}');
  print('ผู้ติดตาม: ${followers ?? 0} คน');

  // วิธีสร้างชื่อเต็มอย่างปลอดภัย
  final String fullName = buildSafeFullName(firstName, lastName);
  print('ชื่อเต็ม: $fullName');

  // การจัดการ Array ที่อาจว่าง
  final List<dynamic>? posts = data['user']?['social']?['posts'];
  if (posts != null && posts.isNotEmpty) {
    print('จำนวนโพสต์: ${posts.length}');
  } else {
    print('ยังไม่มีโพสต์');
  }
}

// ฟังก์ชันสร้างชื่อเต็มอย่างปลอดภัย
String buildSafeFullName(String? firstName, String? lastName) {
  final List<String> nameParts = [];

  if (firstName != null && firstName.isNotEmpty) {
    nameParts.add(firstName);
  }

  if (lastName != null && lastName.isNotEmpty) {
    nameParts.add(lastName);
  }

  return nameParts.isNotEmpty ? nameParts.join(' ') : 'ไม่มีชื่อ';
}

// 2. การตรวจสอบประเภทข้อมูล
void dataTypeValidation() {
  final Map<String, dynamic> mixedData = {
    'age': '25', // String แทน int
    'score': 85.5, // double
    'isActive': 'true', // String แทน bool
    'tags': 'flutter,dart', // String แทน List
  };

  // ตัวอย่างการแปลงข้อมูลอย่างปลอดภัย
  print('การแปลงข้อมูลอย่างปลอดภัย:');

  // แปลง String เป็น int
  final int age = safeParseInt(mixedData['age']);
  print('อายุ: $age ปี');

  // แปลง String เป็น bool
  final bool isActive = safeParseBool(mixedData['isActive']);
  print('สถานะ: ${isActive ? "ใช้งาน" : "ไม่ใช้งาน"}');

  // แปลง String เป็น List
  final List<String> tags = safeParseStringList(mixedData['tags']);
  print('แท็ก: ${tags.join(", ")}');

  // จัดการ double ที่อาจเป็น int
  final double score = safeParseDouble(mixedData['score']);
  print('คะแนน: ${score.toStringAsFixed(1)}');
}

// ฟังก์ชันแปลงข้อมูลอย่างปลอดภัย
int safeParseInt(dynamic value) {
  if (value is int) return value;
  if (value is String) {
    return int.tryParse(value) ?? 0;
  }
  if (value is double) return value.toInt();
  return 0;
}

bool safeParseBool(dynamic value) {
  if (value is bool) return value;
  if (value is String) {
    return value.toLowerCase() == 'true';
  }
  if (value is int) return value != 0;
  return false;
}

double safeParseDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    return double.tryParse(value) ?? 0.0;
  }
  return 0.0;
}

List<String> safeParseStringList(dynamic value) {
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }
  if (value is String && value.isNotEmpty) {
    return value.split(',').map((e) => e.trim()).toList();
  }
  return [];
}

// 3. การจัดการ API Response ที่ผิดพลาด
void handleApiErrors() {
  // จำลอง API Response ที่มีปัญหา
  final Map<String, dynamic> apiResponse1 = {
    'status': 'error',
    'message': 'User not found',
    'data': null,
  };

  final Map<String, dynamic> apiResponse2 = {
    'status': 'success',
    'data': {
      'user': {'id': '123', 'name': 'สมชาย'},
    },
  };

  // การจัดการ Response อย่างปลอดภัย
  print('การจัดการ API Response:');

  handleApiResponse(apiResponse1);
  handleApiResponse(apiResponse2);
}

void handleApiResponse(Map<String, dynamic> response) {
  // ตรวจสอบสถานะก่อน
  final String status = response['status'] ?? 'unknown';

  if (status == 'error') {
    final String message = response['message'] ?? 'เกิดข้อผิดพลาด';
    print('❌ Error: $message');
    return;
  }

  if (status == 'success') {
    final Map<String, dynamic>? data = response['data'];
    if (data != null) {
      final user = data['user'];
      if (user != null) {
        final String userId = user['id'] ?? 'ไม่มี ID';
        final String userName = user['name'] ?? 'ไม่มีชื่อ';
        print('✅ Success: User $userId - $userName');
      } else {
        print('⚠️ Warning: ไม่มีข้อมูลผู้ใช้');
      }
    } else {
      print('⚠️ Warning: ไม่มีข้อมูล');
    }
  } else {
    print('❓ Unknown status: $status');
  }
}

// เทคนิคเพิ่มเติม: การสร้าง Extension สำหรับ Map
extension SafeMapAccess on Map<String, dynamic> {
  // เข้าถึงข้อมูลแบบง่ายๆ
  T? getSafe<T>(String key) {
    final value = this[key];
    return value is T ? value : null;
  }

  // เข้าถึงข้อมูลใน nested path
  dynamic getPath(List<String> path) {
    dynamic current = this;
    for (String key in path) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }
    return current;
  }
}

// ตัวอย่างการใช้ Extension
void extensionExample() {
  final Map<String, dynamic> data = {
    'user': {
      'profile': {'name': 'สมชาย'},
    },
  };

  // ใช้ extension
  final String? name1 = data.getSafe<String>('user'); // null (ไม่ใช่ String)
  final String? name2 = data.getPath(['user', 'profile', 'name']); // "สมชาย"

  print('Name1: $name1');
  print('Name2: $name2');
}
