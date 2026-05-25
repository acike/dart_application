// ตัวอย่าง JSON ที่ซับซ้อนในการทำงานจริง
void main() {
  print('=== ตัวอย่าง JSON ที่ซับซ้อนในการทำงานจริง ===\n');

  // 1. User Profile JSON (จาก Social Media App)
  userProfileExample();

  print('\n${'=' * 50}\n');

  // 2. E-commerce Product JSON
  ecommerceExample();

  print('\n${'=' * 50}\n');

  // 3. Weather API JSON
  weatherApiExample();
}

// 1. ตัวอย่าง User Profile JSON
void userProfileExample() {
  print('📱 User Profile JSON (จาก Facebook/Instagram)');

  // JSON ที่ซับซ้อนจริงๆ ที่เราจะเจอ
  final String jsonString = '''
  {
    "user": {
      "id": "12345",
      "profile": {
        "firstName": "สมชาย",
        "lastName": "ใจดี",
        "avatar": "https://example.com/avatar.jpg",
        "bio": "นักพัฒนา Flutter ที่รักการเรียนรู้",
        "location": {
          "country": "Thailand",
          "city": "Bangkok",
          "coordinates": {
            "lat": 13.7563,
            "lng": 100.5018
          }
        }
      },
      "social": {
        "followers": 1500,
        "following": 300,
        "posts": [
          {
            "id": "post_1",
            "content": "เรียน Dart ไปด้วยกัน!",
            "likes": 45,
            "comments": [
              {"user": "เพื่อน1", "text": "เก่งมาก!"},
              {"user": "เพื่อน2", "text": "สอนด้วยนะ"}
            ],
            "timestamp": "2024-01-15T10:30:00Z"
          },
          {
            "id": "post_2", 
            "content": "Flutter น่าสนใจจัง",
            "likes": 67,
            "comments": [],
            "timestamp": "2024-01-14T15:45:00Z"
          }
        ]
      },
      "settings": {
        "privacy": {
          "profileVisible": true,
          "allowMessages": false,
          "showLocation": true
        },
        "notifications": {
          "email": true,
          "push": true,
          "sms": false
        }
      }
    }
  }
  ''';

  // แปลง JSON String เป็น Map
  // (ในความเป็นจริงจะใช้ dart:convert)
  print('✅ JSON นี้มีข้อมูลซับซ้อน:');
  print('- ข้อมูลผู้ใช้ (profile)');
  print('- ตำแหน่งที่อยู่ (location + coordinates)');
  print('- โพสต์และคอมเมนต์ (arrays ซ้อน objects)');
  print('- การตั้งค่า (nested settings)');
  print('- ขนาด JSON โดยประมาณ: ${jsonString.length} ตัวอักษร');

  // วิธีการจัดการใน Dart
  demonstrateComplexMapHandling();
}

// Model สำหรับ user profile JSON
class UserDataResponse {
  final UserModel user;

  UserDataResponse({required this.user});

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userJson =
        (json['user'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    return UserDataResponse(user: UserModel.fromJson(userJson));
  }
}

class UserModel {
  final String id;
  final ProfileModel profile;
  final SocialModel social;

  UserModel({required this.id, required this.profile, required this.social});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> profileJson =
        (json['profile'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    final Map<String, dynamic> socialJson =
        (json['social'] as Map<String, dynamic>?) ?? <String, dynamic>{};

    return UserModel(
      id: (json['id'] as String?) ?? '',
      profile: ProfileModel.fromJson(profileJson),
      social: SocialModel.fromJson(socialJson),
    );
  }
}

class ProfileModel {
  final String firstName;
  final String lastName;
  final LocationModel location;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.location,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> locationJson =
        (json['location'] as Map<String, dynamic>?) ?? <String, dynamic>{};

    return ProfileModel(
      firstName: (json['firstName'] as String?) ?? '',
      lastName: (json['lastName'] as String?) ?? '',
      location: LocationModel.fromJson(locationJson),
    );
  }
}

class LocationModel {
  final String country;
  final String city;
  final CoordinatesModel coordinates;

  LocationModel({
    required this.country,
    required this.city,
    required this.coordinates,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> coordinatesJson =
        (json['coordinates'] as Map<String, dynamic>?) ?? <String, dynamic>{};

    return LocationModel(
      country: (json['country'] as String?) ?? '',
      city: (json['city'] as String?) ?? '',
      coordinates: CoordinatesModel.fromJson(coordinatesJson),
    );
  }
}

class CoordinatesModel {
  final double lat;
  final double lng;

  CoordinatesModel({required this.lat, required this.lng});

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class SocialModel {
  final int followers;
  final List<PostModel> posts;

  SocialModel({required this.followers, required this.posts});

  factory SocialModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> postJsonList = (json['posts'] as List<dynamic>?) ?? [];
    final List<PostModel> posts = postJsonList
        .whereType<Map<String, dynamic>>()
        .map(PostModel.fromJson)
        .toList();

    return SocialModel(
      followers: (json['followers'] as int?) ?? 0,
      posts: posts,
    );
  }
}

class PostModel {
  final String id;
  final String content;
  final int likes;
  final List<CommentModel> comments;

  PostModel({
    required this.id,
    required this.content,
    required this.likes,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> commentJsonList =
        (json['comments'] as List<dynamic>?) ?? [];
    final List<CommentModel> comments = commentJsonList
        .whereType<Map<String, dynamic>>()
        .map(CommentModel.fromJson)
        .toList();

    return PostModel(
      id: (json['id'] as String?) ?? '',
      content: (json['content'] as String?) ?? '',
      likes: (json['likes'] as int?) ?? 0,
      comments: comments,
    );
  }
}

class CommentModel {
  final String user;
  final String text;

  CommentModel({required this.user, required this.text});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      user: (json['user'] as String?) ?? '',
      text: (json['text'] as String?) ?? '',
    );
  }
}

// แสดงวิธีจัดการ Map ที่ซับซ้อน
void demonstrateComplexMapHandling() {
  print('\n🛠️ วิธีจัดการใน Dart:');

  // สร้าง Map ที่ซับซ้อนแบบปลอดภัย
  final Map<String, dynamic> userData = {
    'user': {
      'id': '12345',
      'profile': {
        'firstName': 'สมชาย',
        'lastName': 'ใจดี',
        'location': {
          'country': 'Thailand',
          'city': 'Bangkok',
          'coordinates': {'lat': 13.7563, 'lng': 100.5018},
        },
      },
      'social': {
        'followers': 1500,
        'posts': [
          {
            'id': 'post_1',
            'content': 'เรียน Dart ไปด้วยกัน!',
            'likes': 45,
            'comments': [
              {'user': 'เพื่อน1', 'text': 'เก่งมาก!'},
              {'user': 'เพื่อน2', 'text': 'สอนด้วยนะ'},
            ],
          },
        ],
      },
    },
  };

  // แปลง Map ให้เป็น Model เพื่อให้เรียกใช้งานง่ายและ type-safe
  final UserDataResponse response = UserDataResponse.fromJson(userData);
  final UserModel user = response.user;

  print('\n🔍 วิธีเข้าถึงข้อมูลผ่าน Model:');
  print('ชื่อ: ${user.profile.firstName}');

  final int firstPostLikes = user.social.posts.isNotEmpty
      ? user.social.posts.first.likes
      : 0;
  print('ไลค์โพสต์แรก: $firstPostLikes');

  print('\nจำนวนโพสต์: ${user.social.posts.length}');
  for (int i = 0; i < user.social.posts.length; i++) {
    final PostModel post = user.social.posts[i];
    print('โพสต์ ${i + 1}: ${post.content}');

    if (post.comments.isNotEmpty) {
      print('  คอมเมนต์: ${post.comments.length} รายการ');
      for (final CommentModel comment in post.comments) {
        print('  - ${comment.user}: ${comment.text}');
      }
    } else {
      print('  ไม่มีคอมเมนต์');
    }
  }
}

// 2. ตัวอย่าง E-commerce JSON
void ecommerceExample() {
  print('🛒 E-commerce Product JSON (จาก Shopee/Lazada)');

  final Map<String, dynamic> productData = {
    'product': {
      'id': 'P001',
      'name': 'iPhone 15 Pro',
      'price': {'original': 45900, 'discount': 43900, 'currency': 'THB'},
      'variants': [
        {
          'color': 'Natural Titanium',
          'storage': '128GB',
          'stock': 5,
          'images': [
            'https://example.com/iphone-1.jpg',
            'https://example.com/iphone-2.jpg',
          ],
        },
        {
          'color': 'Blue Titanium',
          'storage': '256GB',
          'stock': 0,
          'images': ['https://example.com/iphone-blue-1.jpg'],
        },
      ],
      'reviews': {
        'average': 4.5,
        'total': 128,
        'breakdown': {'5': 80, '4': 30, '3': 12, '2': 4, '1': 2},
      },
      'shipping': {
        'free': true,
        'methods': [
          {'name': 'Standard', 'days': 3, 'price': 0},
          {'name': 'Express', 'days': 1, 'price': 50},
        ],
      },
    },
  };

  // วิธีจัดการข้อมูลสินค้า
  analyzeProductData(productData);
}

void analyzeProductData(Map<String, dynamic> data) {
  print('\n📊 วิเคราะห์ข้อมูลสินค้า:');

  final product = data['product'];
  final String productName = product['name'] ?? 'ไม่มีชื่อ';
  final int originalPrice = product['price']?['original'] ?? 0;
  final int discountPrice = product['price']?['discount'] ?? 0;

  print('สินค้า: $productName');
  print('ราคาเดิม: ฿${originalPrice.toString()}');
  print('ราคาลด: ฿${discountPrice.toString()}');

  // คำนวณส่วนลด
  if (originalPrice > 0) {
    final double discountPercent =
        ((originalPrice - discountPrice) / originalPrice * 100);
    print('ส่วนลด: ${discountPercent.toStringAsFixed(1)}%');
  }

  // วิเคราะห์ variants
  final List<dynamic>? variants = product['variants'];
  if (variants != null) {
    print('\nรุ่นที่มี:');
    for (var variant in variants) {
      final String color = variant['color'] ?? 'ไม่ระบุสี';
      final String storage = variant['storage'] ?? 'ไม่ระบุความจุ';
      final int stock = variant['stock'] ?? 0;
      final String status = stock > 0 ? 'มีสินค้า ($stock ชิ้น)' : 'สินค้าหมด';

      print('- $color $storage: $status');
    }
  }

  // วิเคราะห์รีวิว
  final reviews = product['reviews'];
  if (reviews != null) {
    final double average = reviews['average']?.toDouble() ?? 0.0;
    final int total = reviews['total'] ?? 0;
    print('\nรีวิว: ⭐ $average/5.0 จาก $total รีวิว');
  }
}

// 3. ตัวอย่าง Weather API JSON
void weatherApiExample() {
  print('🌤️ Weather API JSON (จาก OpenWeatherMap)');

  final Map<String, dynamic> weatherData = {
    'location': {
      'name': 'Bangkok',
      'country': 'TH',
      'timezone': 'Asia/Bangkok',
    },
    'current': {
      'temperature': 32.5,
      'humidity': 75,
      'description': 'partly cloudy',
      'wind': {'speed': 15.2, 'direction': 'NE'},
    },
    'forecast': [
      {
        'date': '2024-01-15',
        'high': 35,
        'low': 26,
        'condition': 'sunny',
        'hourly': [
          {'time': '06:00', 'temp': 26, 'rain': 0},
          {'time': '12:00', 'temp': 33, 'rain': 0},
          {'time': '18:00', 'temp': 30, 'rain': 10},
        ],
      },
      {
        'date': '2024-01-16',
        'high': 30,
        'low': 24,
        'condition': 'rainy',
        'hourly': [
          {'time': '06:00', 'temp': 24, 'rain': 80},
          {'time': '12:00', 'temp': 28, 'rain': 60},
          {'time': '18:00', 'temp': 26, 'rain': 40},
        ],
      },
    ],
  };

  processWeatherData(weatherData);
}

void processWeatherData(Map<String, dynamic> data) {
  print('\n🌡️ ข้อมูลสภาพอากาศ:');

  // ข้อมูลปัจจุบัน
  final location = data['location'];
  final current = data['current'];

  print('📍 ${location['name']}, ${location['country']}');
  print('อุณหภูมิ: ${current['temperature']}°C');
  print('ความชื้น: ${current['humidity']}%');
  print('สภาพอากาศ: ${current['description']}');

  // พยากรณ์อากาศ
  final List<dynamic>? forecast = data['forecast'];
  if (forecast != null) {
    print('\nพยากรณ์อากาศ ${forecast.length} วัน:');

    for (var day in forecast) {
      final String date = day['date'] ?? '';
      final int high = day['high'] ?? 0;
      final int low = day['low'] ?? 0;
      final String condition = day['condition'] ?? '';

      print('\n📅 $date:');
      print('   สูงสุด: $high°C, ต่ำสุด: $low°C');
      print('   สภาพอากาศ: $condition');

      // ข้อมูลรายชั่วโมง
      final List<dynamic>? hourly = day['hourly'];
      if (hourly != null) {
        print('   รายชั่วโมง:');
        for (var hour in hourly) {
          final String time = hour['time'] ?? '';
          final int temp = hour['temp'] ?? 0;
          final int rain = hour['rain'] ?? 0;
          print('     $time: $temp°C, ฝน $rain%');
        }
      }
    }
  }
}
