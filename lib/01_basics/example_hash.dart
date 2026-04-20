class Order {
  final String id;
  final double amount;
  final String status;

  Order({
    required this.id,
    required this.amount,
    required this.status,
  });

  // == : บอกว่า object 2 ตัว "ค่าเท่ากัน" เมื่อ field สำคัญเท่ากัน
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.id == id &&
        other.amount == amount &&
        other.status == status;
  }

  // hashCode : สร้างรหัสจาก field เดียวกับที่ใช้ใน ==
  // ถ้า == เท่ากัน hashCode ต้องเท่ากันด้วย
  @override
  int get hashCode => Object.hash(id, amount, status);

  @override
  String toString() => 'Order(id: $id, amount: $amount, status: $status)';
}

void main() {
  final Order order1 = Order(id: 'A001', amount: 250.0, status: 'paid');
  final Order order2 = Order(id: 'A001', amount: 250.0, status: 'paid');
  final Order order3 = order1;

  print('--- Compare Order objects ---');
  print('order1 == order2: ${order1 == order2}'); // true (ค่าเท่ากัน)
  print('identical(order1, order2): ${identical(order1, order2)}'); // false
  print('identical(order1, order3): ${identical(order1, order3)}'); // true

  print('\n--- hashCode ---');
  print('order1.hashCode: ${order1.hashCode}');
  print('order2.hashCode: ${order2.hashCode}');
  print(
    'hashCode เท่ากันไหม: ${order1.hashCode == order2.hashCode}',
  ); // true

  print('\n--- ใช้กับ Set ---');
  final Set<Order> orderSet = <Order>{order1, order2};
  // ถ้า override == และ hashCode ถูกต้อง order1/order2 จะนับเป็นค่าเดียวกัน
  print('orderSet: $orderSet');
  print('จำนวนใน set: ${orderSet.length}'); // 1
}
