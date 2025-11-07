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
const Currency usd = Currency('USD', '\$'); // ใช้ '\$' ปลอดภัยที่สุด
