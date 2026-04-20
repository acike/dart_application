void main() {
 // ตัวอย่างการใช้งานจริง

  // ตัวอย่าง List: รายการสินค้า
  final products = ['Apple', 'Banana', 'Orange'];

  // ตัวอย่าง Set: รหัสสินค้าที่ไม่ซ้ำ
  final productCodes = {'A001', 'A002', 'A001'};
  print('รหัสสินค้า: $productCodes');
  print('มี A001 หรือไม่: ${productCodes.contains('A001')}');

  // ตัวอย่าง Map: ข้อมูลสินค้า
  final apple = {'name': 'Apple', 'price': 30};
  final productInfo = {
    'A001': apple, // ใช้ object เดียวกัน
    'A002': {'name': 'Banana', 'price': 20},
  };
  print('ข้อมูลสินค้า: $productInfo');
  print('มี A001 หรือไม่: ${productInfo.containsKey('A001')} }');
  print('มี A003 หรือไม่: ${productInfo.containsKey('A003')} }');
  print('มี A001 หรือไม่: ${productInfo.containsValue(apple)}');
  print(
    'มี A003 หรือไม่: ${productInfo.containsValue({'name': 'Apple', 'price': 30})}',
  );
  final bool hasApple = productInfo.values.any(
  (Map<String, Object> product) =>
      product['name'] == 'Apple' && product['price'] == 30,
);
  print(hasApple); // true
}