void main() {
  Solution solution = Solution();
}

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    // ใช้ HashMap เพื่อเก็บค่าที่เจอแล้วและตำแหน่งของมัน
    Map<int, int> numMap = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

      // ถ้าเคยเจอตัวที่ต้องการแล้ว ก็คืนค่าตำแหน่งทั้งสอง
      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }

      // เก็บค่าปัจจุบันและตำแหน่งลงใน HashMap

      numMap[nums[i]] = i;
    }

    // ไม่พบคำตอบ

    return [];
  }
}
