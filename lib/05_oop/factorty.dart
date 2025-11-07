// Factory vs Static Comparison - Knowledge Repository
// เปรียบเทียบการใช้ Factory Constructor กับ Static Methods

import 'dart:async';
import 'dart:math';

void main() {
  print('🏭 Factory vs Static Comparison Demo\n');

  // 1. Basic Comparison
  print('=== 1. Basic Comparison ===');
  basicComparison();

  print('\n=== 2. OOP Support ===');
  oopSupportDemo();

  print('\n=== 3. Testing & Mocking ===');
  testingDemo();

  print('\n=== 4. Memory Management ===');
  memoryManagementDemo();

  print('\n=== 5. Real-world Examples ===');
  realWorldExamples();
}

// ===== 1. BASIC COMPARISON =====

/// Static Version - ง่าย แต่ไม่ใช่ OOP
class ConfigStatic {
  static final String apiKey = 'API_KEY_123';
  static final String baseUrl = 'https://api.example.com';
  static int requestCount = 0;

  // Static methods
  static void incrementRequest() {
    requestCount++;
  }

  static String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }

  static void printStatus() {
    print('📊 Static Config:');
    print('   API Key: $apiKey');
    print('   Base URL: $baseUrl');
    print('   Request Count: $requestCount');
  }
}

/// Factory Version - OOP แท้
class ConfigFactory {
  final String apiKey;
  final String baseUrl;
  int requestCount = 0;
  static ConfigFactory? _instance;

  ConfigFactory._internal(this.apiKey, this.baseUrl);

  factory ConfigFactory() {
    _instance ??= ConfigFactory._internal(
      'API_KEY_123',
      'https://api.example.com',
    );
    return _instance!;
  }

  factory ConfigFactory.custom(String apiKey, String baseUrl) {
    return ConfigFactory._internal(apiKey, baseUrl);
  }

  void incrementRequest() {
    requestCount++;
  }

  String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }

  void printStatus() {
    print('🏭 Factory Config:');
    print('   API Key: $apiKey');
    print('   Base URL: $baseUrl');
    print('   Request Count: $requestCount');
  }

  void dispose() {
    _instance = null;
  }
}

void basicComparison() {
  // Static usage
  ConfigStatic.incrementRequest();
  ConfigStatic.printStatus();
  print('   URL: ${ConfigStatic.getFullUrl('/users')}');

  print('');

  // Factory usage
  final config = ConfigFactory();
  config.incrementRequest();
  config.printStatus();
  print('   URL: ${config.getFullUrl('/users')}');
}

// ===== 2. OOP SUPPORT =====

/// Abstract base class สำหรับ database connections
abstract class DatabaseConnection {
  void connect();
  void disconnect();
  String get connectionString;
}

/// MySQL Implementation with Factory
class MySQLConnection extends DatabaseConnection {
  static MySQLConnection? _instance;
  final String host;
  final int port;

  MySQLConnection._internal(this.host, this.port);

  factory MySQLConnection({String host = 'localhost', int port = 3306}) {
    _instance ??= MySQLConnection._internal(host, port);
    return _instance!;
  }

  @override
  void connect() => print('🔌 Connecting to MySQL at $host:$port...');

  @override
  void disconnect() => print('🔌 Disconnecting from MySQL...');

  @override
  String get connectionString => 'mysql://$host:$port';
}

/// PostgreSQL Implementation with Factory
class PostgreSQLConnection extends DatabaseConnection {
  static PostgreSQLConnection? _instance;
  final String host;
  final int port;

  PostgreSQLConnection._internal(this.host, this.port);

  factory PostgreSQLConnection({String host = 'localhost', int port = 5432}) {
    _instance ??= PostgreSQLConnection._internal(host, port);
    return _instance!;
  }

  @override
  void connect() => print('🔌 Connecting to PostgreSQL at $host:$port...');

  @override
  void disconnect() => print('🔌 Disconnecting from PostgreSQL...');

  @override
  String get connectionString => 'postgresql://$host:$port';
}

/// Static Database Helper - ไม่รองรับ polymorphism
class StaticDatabaseHelper {
  static void connect() => print('🔌 Static: Connecting to database...');
  static void disconnect() => print('🔌 Static: Disconnecting...');
  static String getConnectionString() => 'static://database';
}

void oopSupportDemo() {
  print('✅ Factory - รองรับ OOP:');

  // Polymorphism with Factory
  List<DatabaseConnection> connections = [
    MySQLConnection(),
    PostgreSQLConnection(),
  ];

  for (var connection in connections) {
    connection.connect(); // Polymorphic call
    print('   Connection: ${connection.connectionString}');
    connection.disconnect();
  }

  print('\n❌ Static - ไม่รองรับ OOP:');
  StaticDatabaseHelper.connect();
  print('   Connection: ${StaticDatabaseHelper.getConnectionString()}');
  StaticDatabaseHelper.disconnect();
  // ไม่สามารถใช้ polymorphism ได้
}

// ===== 3. TESTING & MOCKING =====

/// Interface สำหรับ API Service
abstract class ApiService {
  Future<Map<String, dynamic>> getData(String endpoint);
  void setApiKey(String key);
}

/// Real API Service Implementation
class RealApiService implements ApiService {
  static RealApiService? _instance;
  String _apiKey = 'real_key';

  RealApiService._internal();

  factory RealApiService() {
    _instance ??= RealApiService._internal();
    return _instance!;
  }

  @override
  Future<Map<String, dynamic>> getData(String endpoint) async {
    print('🌐 Calling real API: $endpoint with key: $_apiKey');
    await Future.delayed(Duration(milliseconds: 100)); // Simulate network
    return {'data': 'real data from $endpoint', 'status': 'success'};
  }

  @override
  void setApiKey(String key) {
    _apiKey = key;
  }
}

/// Mock API Service for Testing
class MockApiService implements ApiService {
  String _apiKey = 'mock_key';

  @override
  Future<Map<String, dynamic>> getData(String endpoint) async {
    print('🧪 Mock API call: $endpoint with key: $_apiKey');
    return {'data': 'mock data from $endpoint', 'status': 'mock_success'};
  }

  @override
  void setApiKey(String key) {
    _apiKey = key;
  }
}

/// Service ที่ใช้ Dependency Injection
class UserService {
  final ApiService _apiService;

  UserService(this._apiService);

  Future<List<String>> getUsers() async {
    final response = await _apiService.getData('/users');
    return ['User 1', 'User 2', 'User 3']; // Process response
  }
}

/// Static API Service - ยากต่อการ test
class StaticApiService {
  static String _apiKey = 'static_key';

  static Future<Map<String, dynamic>> getData(String endpoint) async {
    print('🔒 Static API call: $endpoint with key: $_apiKey');
    await Future.delayed(Duration(milliseconds: 100));
    return {'data': 'static data from $endpoint', 'status': 'static_success'};
  }

  static void setApiKey(String key) {
    _apiKey = key;
  }
}

void testingDemo() {
  print('✅ Factory - ง่ายต่อการ test (Dependency Injection):');

  // Production code
  final realService = UserService(RealApiService());
  print('   Production service created');

  // Test code
  final testService = UserService(MockApiService());
  print('   Test service with mock created');

  print('\n❌ Static - ยากต่อการ test:');
  print('   Static service - ไม่สามารถ inject mock ได้');
  print('   ต้องเรียก StaticApiService ตรงๆ เสมอ');
}

// ===== 4. MEMORY MANAGEMENT =====

/// Factory with Memory Management
class ImageCache {
  static ImageCache? _instance;
  final Map<String, String> _cache = {}; // String แทน Image เพื่อ demo

  ImageCache._internal();

  factory ImageCache() {
    _instance ??= ImageCache._internal();
    return _instance!;
  }

  void cacheImage(String url, String imageData) {
    _cache[url] = imageData;
    print('📸 Cached image: $url (Total: ${_cache.length} images)');
  }

  String? getImage(String url) {
    return _cache[url];
  }

  void clearCache() {
    final count = _cache.length;
    _cache.clear();
    print('🗑️ Cleared $count images from cache');
  }

  void dispose() {
    clearCache();
    _instance = null;
    print('💀 ImageCache disposed');
  }

  int get cacheSize => _cache.length;
}

/// Static Cache - ไม่สามารถ dispose
class StaticImageCache {
  static final Map<String, String> _cache = {};

  static void cacheImage(String url, String imageData) {
    _cache[url] = imageData;
    print('📸 Static cached: $url (Total: ${_cache.length} images)');
  }

  static String? getImage(String url) {
    return _cache[url];
  }

  static void clearCache() {
    final count = _cache.length;
    _cache.clear();
    print('🗑️ Static cleared $count images');
  }

  // ไม่สามารถ dispose class static ได้
  static int get cacheSize => _cache.length;
}

void memoryManagementDemo() {
  print('✅ Factory - จัดการ memory ได้:');

  final cache = ImageCache();
  cache.cacheImage('image1.jpg', 'data1');
  cache.cacheImage('image2.jpg', 'data2');
  print('   Cache size: ${cache.cacheSize}');

  cache.clearCache();
  cache.dispose(); // ล้าง instance ได้

  print('\n❌ Static - ติดค้างใน memory:');

  StaticImageCache.cacheImage('static1.jpg', 'data1');
  StaticImageCache.cacheImage('static2.jpg', 'data2');
  print('   Static cache size: ${StaticImageCache.cacheSize}');

  StaticImageCache.clearCache();
  print('   Static class ยังคงอยู่ใน memory (ไม่สามารถ dispose)');
}

// ===== 5. REAL-WORLD EXAMPLES =====

/// Environment Configuration Factory
abstract class AppConfig {
  String get apiUrl;
  String get apiKey;
  bool get isDebugMode;
  Duration get timeout;

  factory AppConfig.development() => DevConfig();
  factory AppConfig.production() => ProdConfig();
  factory AppConfig.testing() => TestConfig();
}

class DevConfig implements AppConfig {
  static DevConfig? _instance;

  DevConfig._internal();
  factory DevConfig() => _instance ??= DevConfig._internal();

  @override
  String get apiUrl => 'https://dev-api.example.com';
  @override
  String get apiKey => 'dev_key_123';
  @override
  bool get isDebugMode => true;
  @override
  Duration get timeout => Duration(seconds: 30);
}

class ProdConfig implements AppConfig {
  static ProdConfig? _instance;

  ProdConfig._internal();
  factory ProdConfig() => _instance ??= ProdConfig._internal();

  @override
  String get apiUrl => 'https://api.example.com';
  @override
  String get apiKey => 'prod_key_456';
  @override
  bool get isDebugMode => false;
  @override
  Duration get timeout => Duration(seconds: 10);
}

class TestConfig implements AppConfig {
  static TestConfig? _instance;

  TestConfig._internal();
  factory TestConfig() => _instance ??= TestConfig._internal();

  @override
  String get apiUrl => 'https://test-api.example.com';
  @override
  String get apiKey => 'test_key_789';
  @override
  bool get isDebugMode => true;
  @override
  Duration get timeout => Duration(seconds: 5);
}

/// Logger Factory Pattern
class Logger {
  static Logger? _instance;
  final List<String> _logs = [];

  Logger._internal();

  factory Logger() {
    _instance ??= Logger._internal();
    return _instance!;
  }

  void log(String message, {String level = 'INFO'}) {
    final timestamp = DateTime.now().toIso8601String();
    final logEntry = '[$timestamp] [$level] $message';
    _logs.add(logEntry);
    print('📝 $logEntry');
  }

  void info(String message) => log(message, level: 'INFO');
  void warning(String message) => log(message, level: 'WARNING');
  void error(String message) => log(message, level: 'ERROR');

  List<String> getAllLogs() => List.unmodifiable(_logs);

  void clearLogs() {
    _logs.clear();
    print('🗑️ Logs cleared');
  }

  int get logCount => _logs.length;
}

/// Utility Static Methods
class MathUtils {
  // Pure functions - เหมาะกับ static
  static double calculateDistance(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }

  static double calculateArea(double width, double height) {
    return width * height;
  }

  static int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }

  static List<int> generateFibonacci(int count) {
    if (count <= 0) return [];
    if (count == 1) return [0];
    if (count == 2) return [0, 1];

    List<int> fib = [0, 1];
    for (int i = 2; i < count; i++) {
      fib.add(fib[i - 1] + fib[i - 2]);
    }
    return fib;
  }
}

void realWorldExamples() {
  print('🌍 Real-world Factory Examples:');

  // Environment Configuration
  AppConfig config = AppConfig.development();
  print('   Environment: ${config.apiUrl}');
  print('   Debug Mode: ${config.isDebugMode}');
  print('   Timeout: ${config.timeout.inSeconds}s');

  // Logger
  final logger = Logger();
  logger.info('Application started');
  logger.warning('Low memory warning');
  logger.error('Connection failed');
  print('   Total logs: ${logger.logCount}');

  print('\n🧮 Static Utility Examples:');

  // Math utilities
  double distance = MathUtils.calculateDistance(0, 0, 3, 4);
  print('   Distance: $distance');

  double area = MathUtils.calculateArea(10, 5);
  print('   Area: $area');

  int fact = MathUtils.factorial(5);
  print('   Factorial 5: $fact');

  List<int> fib = MathUtils.generateFibonacci(8);
  print('   Fibonacci: $fib');
}

// ===== SUMMARY & GUIDELINES =====

/// 📚 SUMMARY:
///
/// Factory Constructor ใช้เมื่อ:
/// ✅ ต้องการ OOP (inheritance, polymorphism)
/// ✅ ต้องการ Dependency Injection
/// ✅ ต้องการจัดการ memory (dispose)
/// ✅ ต้องการ configuration objects
/// ✅ ต้องการ testability (mocking)
/// ✅ ต้องการ lazy initialization
///
/// Static Methods ใช้เมื่อ:
/// ✅ Pure functions (ไม่มี side effects)
/// ✅ Utility functions
/// ✅ Constants และ enums
/// ✅ Simple helpers
/// ✅ Performance critical code
/// ✅ Mathematical operations
///
/// ข้อควรจำ:
/// - Factory = Object-oriented approach
/// - Static = Procedural approach
/// - เลือกใช้ตามความเหมาะสม
/// - Factory ซับซ้อนกว่า แต่ยืดหยุ่นกว่า
/// - Static ง่ายกว่า แต่จำกัดกว่า
