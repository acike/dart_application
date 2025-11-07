// เฉลย: Printer Queue

import '../queue.dart';

class PrinterQueue {
  final SimpleQueue<String> _queue = SimpleQueue<String>();

  void addJob(String fileName) {
    _queue.enqueue(fileName);
  }

  String? printNextJob() {
    if (_queue.isEmpty) {
      print('No jobs in the queue.');
      return null;
    }
    final String current = _queue.dequeue();
    print('Printing: $current');
    return current;
  }

  int get pendingJobs => _queue.size;
}

void main() {
  final PrinterQueue pq = PrinterQueue();
  pq.addJob('invoice_001.pdf');
  pq.addJob('report_q2.docx');
  pq.addJob('poster.png');

  while (pq.pendingJobs > 0) {
    pq.printNextJob();
  }

  // ลองตอนว่าง
  pq.printNextJob();
}
