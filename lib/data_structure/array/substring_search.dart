int substringSearch(String text, String pattern) {
  int n = text.length, m = pattern.length;
  // n = ความยาว text, m = ความยาว pattern
  // Edge cases
  if (m == 0) return 0; // Empty pattern
  if (m > n) return -1; // Pattern longer than text
  for (int i = 0; i <= n - m; i++) {
    // วนลูปตำแหน่งเริ่มต้นที่เป็นไปได้
    // ทำไมถึง n - m? เพราะไม่ต้องเช็คเกินจุดที่ pattern จะไม่พอ
    int j = 0;
    // j = ตัวนับสำหรับเปรียบเทียบ pattern
    while (j < m && text[i + j] == pattern[j]) {
      // j < m       →  ป้องกันการอ่าน pattern เกิน

      j++;
      // เปรียบเทียบทีละตัวอักษร จนกว่าจะไม่ตรงหรือครบ pattern
      //       เปรียบเทียบทีละตัวอักษร:
      // text[i+0] vs pattern[0]
      // text[i+1] vs pattern[1]
      // text[i+2] vs pattern[2]
      // ...

      // หยุดเมื่อ:
      // 1. ไม่ตรงกัน (text[i+j] ≠ pattern[j])
      // 2. หรือเปรียบเทียบครบแล้ว (j == m)
    }
    if (j == m) return i;
    // ถ้า j ครบ m แสดงว่าเจอ pattern แล้ว!
  }
  return -1; // ไม่เจอ
}

void main() {
  print(substringSearch('hello', 'll'));
}
