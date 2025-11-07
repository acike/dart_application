// ไฟล์: lib/09_oop_deep_dive/2b_constructors_banking.dart
import 'dart:math'; // สำหรับ Random ID

// --- ประเภทบัญชี (Enum) ---
enum AccountType { checking, savings, loan }

// --- สกุลเงิน (Class สำหรับ Constant Constructor) ---
class Currency {
  final String code; // เช่น THB, USD
  final String symbol; // เช่น ฿, $

  // 4. Constant Constructor
  // ใช้เมื่อต้องการสร้าง object ที่เป็นค่าคงที่ตั้งแต่ compile time
  // มีประโยชน์สำหรับข้อมูลที่ไม่เปลี่ยนเช่น สกุลเงิน, ค่า config พื้นฐาน
  // เงื่อนไข: field ทุกตัวต้องเป็น final
  const Currency(this.code, this.symbol);

  @override
  String toString() => code; // แสดงเป็น code เมื่อ print
}

// --- ค่าคงที่ของสกุลเงิน ---
const Currency thb = Currency('THB', '฿');
const Currency usd = Currency('USD', '\$');

// --- คลาสบัญชีธนาคาร ---
class BankAccount {
  // --- Fields ---
  final String accountId; // ID เฉพาะของบัญชี (ไม่ควรเปลี่ยน)
  final String accountHolderName; // ชื่อเจ้าของบัญชี (ไม่ควรเปลี่ยน)
  double _balance; // ยอดเงินคงเหลือ (private เพื่อควบคุมผ่าน method)
  final AccountType accountType; // ประเภทบัญชี (ไม่ควรเปลี่ยน)
  final Currency currency; // สกุลเงิน (ไม่ควรเปลี่ยน)
  final DateTime creationDate; // วันที่สร้างบัญชี (ไม่ควรเปลี่ยน)

  // --- Cache สำหรับ Factory Constructor ---
  // เก็บ instance ที่เคยถูก "ดึงข้อมูล" มาแล้วด้วย Factory ตาม ID
  static final Map<String, BankAccount> _accountCache = {};

  // --- Constructor หลัก (Private Named Constructor) ---
  // ใช้เป็นศูนย์กลางในการกำหนดค่าสุดท้ายให้กับ final fields ทั้งหมด
  // ทำให้ constructor อื่นๆ redirect มาที่นี่ เพื่อลดโค้ดซ้ำซ้อน
  BankAccount._internal(
    this.accountId,
    this.accountHolderName,
    this._balance,
    this.accountType,
    this.currency,
    this.creationDate, // รับวันที่สร้างจาก constructor ที่เรียกมา
  ) {
    // สามารถใส่ logic เพิ่มเติมหลัง : ได้ เช่น การ log หรือ validation เบื้องต้น
    print(
      '    [Internal] สร้าง/กำหนดค่า BankAccount ID: $accountId เรียบร้อย ณ $creationDate',
    );
  }

  // --- 1. Named Constructor: สำหรับ "สร้างบัญชีใหม่" ---
  // เหมาะสำหรับกรณีที่ต้องการสร้าง object ใหม่จริงๆ และมีขั้นตอนเฉพาะ
  // เช่น การ generate Account ID ใหม่
  BankAccount.newAccount({
    required String accountHolderName,
    double initialDeposit = 0.0, // เงินฝากเริ่มต้น (อาจเป็น 0)
    required AccountType accountType,
    required Currency currency,
  }) : this._internal(
         // Redirecting ไปยัง _internal หลังจากเตรียมข้อมูลครบ
         _generateAccountId(), // สร้าง ID ใหม่
         accountHolderName,
         initialDeposit,
         accountType,
         currency,
         DateTime.now(), // วันที่สร้างคือ ณ ตอนนี้
         // ไม่ต้องใส่ body {} เพราะ redirecting ทำงานก่อน body
       );

  // --- 1. Named Constructor: สำหรับ "โหลดข้อมูลจากฐานข้อมูล/API" ---
  // เหมาะสำหรับกรณีที่ได้ข้อมูลมาครบถ้วนแล้วจากแหล่งอื่น
  // และต้องการสร้าง object ให้ตรงกับข้อมูลนั้นๆ
  BankAccount.fromPersistence({
    required this.accountId,
    required this.accountHolderName,
    required double balance,
    required this.accountType,
    required this.currency,
    required this.creationDate, // วันที่สร้างมาจากข้อมูลที่โหลดมา
  }) : _balance =
           balance // กำหนดค่า balance ใน initializer list
  // ไม่ได้ redirect ไป _internal เพราะเรามี creationDate จาก DB แล้ว
  // และต้องการแสดงให้เห็นว่า named constructor ไม่จำเป็นต้อง redirect เสมอไป
  // หรือจะสร้าง _internal อีกตัวที่รับ date ก็ได้ แล้วแต่การออกแบบ
  {
    print('    [fromPersistence] โหลดข้อมูลบัญชี ID: $accountId เรียบร้อย');
    // เพิ่มเข้า cache หลังจากโหลดเสร็จ เผื่อมีการเรียกใช้ด้วย Factory
    _accountCache[accountId] = this;
  }

  // --- 2. Factory Constructor: สำหรับ "ดึงข้อมูลบัญชีด้วย ID" ---
  // ใช้ keyword 'factory'
  // *Use Case ใน Banking App:*
  //   - อาจใช้เป็นจุดเข้าหลักในการ "ขอ" object บัญชีด้วย ID
  //   - เบื้องหลัง Factory อาจจะไปเช็ค Cache ก่อน ถ้ามีก็คืนตัวเดิม (ประหยัด memory/ไม่ต้อง fetch ซ้ำ)
  //   - ถ้าไม่มีใน Cache อาจจะไป Fetch ข้อมูลจาก API/Database จริงๆ แล้วค่อยสร้าง Object
  //     (อาจจะเรียก Named Constructor `fromPersistence` ข้างใน) แล้วเก็บลง Cache ก่อนคืนค่า
  factory BankAccount.getAccount(String accountId) {
    print('\n--- Factory: กำลังร้องขอบัญชี ID: $accountId ---');
    // 1. เช็ค Cache ก่อน
    if (_accountCache.containsKey(accountId)) {
      print('    พบ $accountId ใน Cache คืน instance เดิม');
      return _accountCache[accountId]!; // คืนค่าจาก Cache
    } else {
      // 2. ถ้าไม่มีใน Cache -> จำลองการ Fetch ข้อมูลจาก Database/API
      print('    ไม่พบ $accountId ใน Cache -> จำลองการ Fetch ข้อมูล...');
      // (ในแอปจริง ตรงนี้จะเป็นโค้ดเรียก API/DB)
      // ... สมมติว่า fetch สำเร็จ ได้ข้อมูลมา ...
      Map<String, dynamic> fetchedData = _simulateFetchFromDatabase(accountId);

      // 3. สร้าง Object จากข้อมูลที่ Fetch มา (อาจใช้ Named Constructor อื่น)
      print('    Fetch สำเร็จ สร้าง Object จากข้อมูล...');
      final account = BankAccount.fromPersistence(
        accountId: fetchedData['id'],
        accountHolderName: fetchedData['holder'],
        balance: fetchedData['balance'],
        accountType: fetchedData['type'],
        currency: fetchedData['currency'],
        creationDate: fetchedData['created'],
      );
      // 4. เก็บลง Cache ก่อนคืนค่า (ทำใน fromPersistence แล้ว)
      // _accountCache[accountId] = account;
      print(
        '    สร้างและ Cache บัญชี $accountId เรียบร้อย คืนค่า instance ใหม่',
      );
      return account; // คืนค่า instance ที่เพิ่งสร้าง (ซึ่งถูก cache แล้ว)
    }
  }

  // --- Helper Methods ---
  // ฟังก์ชันจำลองการสร้าง Account ID (ปกติจะซับซ้อนกว่านี้)
  static String _generateAccountId() {
    return 'ACC-${Random().nextInt(100000).toString().padLeft(5, '0')}';
  }

  // ฟังก์ชันจำลองการดึงข้อมูลจาก DB
  static Map<String, dynamic> _simulateFetchFromDatabase(String accountId) {
    // จำลองข้อมูลที่อาจได้คืนมาจาก DB/API
    return {
      'id': accountId,
      'holder': 'ผู้ใช้จำลอง ($accountId)',
      'balance': Random().nextDouble() * 10000,
      'type': AccountType.values[Random().nextInt(AccountType.values.length)],
      'currency': Random().nextBool() ? thb : usd,
      'created': DateTime.now().subtract(Duration(days: Random().nextInt(365))),
    };
  }

  // --- Instance Methods ---
  double get balance => _balance; // Getter สำหรับอ่านยอดเงิน

  void deposit(double amount) {
    if (amount <= 0) {
      print('[$accountId] ข้อผิดพลาด: จำนวนเงินฝากต้องมากกว่า 0');
      return;
    }
    _balance += amount;
    print(
      '[$accountId] ฝาก ${currency.symbol}${amount.toStringAsFixed(2)} ยอดคงเหลือ ${currency.symbol}${_balance.toStringAsFixed(2)}',
    );
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('[$accountId] ข้อผิดพลาด: จำนวนเงินถอนต้องมากกว่า 0');
      return;
    }
    if (amount > _balance) {
      print(
        '[$accountId] ข้อผิดพลาด: ยอดเงินไม่พอ (${currency.symbol}${_balance.toStringAsFixed(2)})',
      );
      return;
    }
    _balance -= amount;
    print(
      '[$accountId] ถอน ${currency.symbol}${amount.toStringAsFixed(2)} ยอดคงเหลือ ${currency.symbol}${_balance.toStringAsFixed(2)}',
    );
  }

  @override
  String toString() {
    return 'BankAccount(ID: $accountId, Holder: $accountHolderName, Type: ${accountType.name}, Balance: ${currency.symbol}${_balance.toStringAsFixed(2)}, Currency: $currency, Created: $creationDate)';
  }
}

// --- Main Function (ตัวอย่างการใช้งาน) ---
void main() {
  print('--- เริ่มต้นแอปธนาคารจำลอง ---');

  // --- 1. การใช้ Named Constructor: สร้างบัญชีใหม่ ---
  print('\n=== การเปิดบัญชีใหม่ ===');
  var acc1 = BankAccount.newAccount(
    accountHolderName: 'สมชาย ใจดี',
    accountType: AccountType.savings,
    currency: thb,
    initialDeposit: 500.0,
  );
  print('สร้างบัญชีใหม่สำเร็จ: $acc1');
  acc1.deposit(1000);

  var acc2 = BankAccount.newAccount(
    accountHolderName: 'John Doe',
    accountType: AccountType.checking,
    currency: usd,
  );
  print('สร้างบัญชีใหม่อีกอันสำเร็จ: $acc2');
  acc2.deposit(300.50);
  acc2.withdraw(50);

  // --- 2. การใช้ Factory Constructor: ดึงข้อมูลบัญชี (จำลอง Fetch/Cache) ---
  print('\n=== การดึงข้อมูลบัญชี ===');
  String targetAccountId = acc1.accountId; // ใช้ ID ของบัญชีที่เพิ่งสร้าง
  print('\nครั้งที่ 1: ขอบัญชี ID: $targetAccountId');
  var fetchedacc1Attempt1 = BankAccount.getAccount(targetAccountId);
  print('ได้รับบัญชี: $fetchedacc1Attempt1');
  fetchedacc1Attempt1.withdraw(100); // ลองทำรายการกับบัญชีที่ดึงมา

  print('\nครั้งที่ 2: ขอบัญชี ID เดิม: $targetAccountId');
  var fetchedacc1Attempt2 = BankAccount.getAccount(targetAccountId);
  print('ได้รับบัญชี: $fetchedacc1Attempt2');
  // ตรวจสอบว่าเป็น instance เดียวกันกับครั้งแรกหรือไม่ (ควรเป็น true เพราะมาจาก cache)
  print(
    '    Instance ที่ได้ครั้งที่ 1 และ 2 เป็นตัวเดียวกัน: ${identical(fetchedacc1Attempt1, fetchedacc1Attempt2)}',
  );

  print('\nครั้งที่ 3: ขอบัญชี ID อื่น (สมมติว่ายังไม่มีใน cache)');
  String anotherAccountId = 'ACC-99999';
  var fetchedAcc3 = BankAccount.getAccount(anotherAccountId);
  print('ได้รับบัญชี: $fetchedAcc3');
  fetchedAcc3.deposit(555);

  print('\nครั้งที่ 4: ขอบัญชี ID เดิมของครั้งที่ 3: $anotherAccountId');
  var fetchedacc3Again = BankAccount.getAccount(anotherAccountId);
  print('ได้รับบัญชี: $fetchedacc3Again');
  print(
    '    Instance ที่ได้ครั้งที่ 3 และ 4 เป็นตัวเดียวกัน: ${identical(fetchedAcc3, fetchedacc3Again)}',
  );

  // --- 3. การใช้ Named Constructor: โหลดข้อมูล (สมมติว่ามาจากไฟล์/API อื่น) ---
  print('\n=== การโหลดข้อมูลบัญชีจาก Persistence ===');
  // จำลองข้อมูลดิบที่อาจได้มา
  Map<String, dynamic> rawData = {
    'id': 'ACC-LOADED-123',
    'holder': 'Somsri Loaded',
    'balance': 15000.75,
    'type': 'savings', // ต้องแปลงเป็น Enum
    'currencyCode': 'THB', // ต้องแปลงเป็น Currency object
    'created': '2023-05-10T10:30:00Z', // ต้องแปลงเป็น DateTime
  };

  // แปลงข้อมูลดิบก่อนส่งเข้า constructor
  AccountType loadedType = AccountType.values.firstWhere(
    (e) => e.name == rawData['type'],
    orElse: () => AccountType.checking,
  );
  Currency loadedCurrency = (rawData['currencyCode'] == 'THB') ? thb : usd;
  DateTime loadedDate = DateTime.parse(rawData['created']);

  var loadedAccount = BankAccount.fromPersistence(
    accountId: rawData['id'],
    accountHolderName: rawData['holder'],
    balance: rawData['balance'],
    accountType: loadedType,
    currency: loadedCurrency,
    creationDate: loadedDate,
  );
  print('โหลดบัญชีจากข้อมูลสำเร็จ: $loadedAccount');
  loadedAccount.withdraw(2000);

  // --- 4. การใช้ Constant Constructor (ผ่าน Currency) ---
  print('\n=== การใช้ Constant Constructor (Currency) ===');
  print('สกุลเงิน THB: $thb (Symbol: ${thb.symbol})');
  print('สกุลเงิน USD: $usd (Symbol: ${usd.symbol})');
  // แสดงให้เห็นว่า const object ที่มีค่าเหมือนกัน เป็น instance เดียวกัน
  const localThb = Currency('THB', '฿');
  print(
    '    thb และ localThb เป็น instance เดียวกัน: ${identical(thb, localThb)}',
  );

  print('\n--- จบการทำงาน ---');
}
