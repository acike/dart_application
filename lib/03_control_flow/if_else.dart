// ตัวอย่างการควบคุมการทำงานด้วย if-else
void main() {
  final age = 20;

  if (age >= 20) {
    print('คุณเป็นผู้ใหญ่');
  } else {
    print('คุณยังเป็นเด็ก');
  }

  // Ternary operator
  final status = age >= 20 ? 'ผู้ใหญ่' : 'เด็ก';
  print('สถานะ: $status');
}
