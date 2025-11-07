// แบบฝึกหัด: จำลองคิวห้องฉุกเฉิน (Hospital Emergency Queue)
// โจทย์: ใช้ PriorityQueue จัดลำดับผู้ป่วยตามความรุนแรง (1=หนักมาก, 5=เล็กน้อย)

import '../priority_queue.dart';

class Patient {
  final String name;
  final String condition;
  final int severity; // 1=critical, 2=serious, 3=moderate, 4=minor, 5=trivial

  Patient(this.name, this.condition, this.severity);

  @override
  String toString() => '$name ($condition, severity: $severity)';
}

class HospitalQueue {
  final PriorityQueue<Patient> _queue = PriorityQueue<Patient>();

  void admitPatient(Patient patient) {
    _queue.enqueue(patient, patient.severity);
    print('Admitted: ${patient.name} with ${patient.condition}');
  }

  Patient? treatNextPatient() {
    final Patient? next = _queue.dequeue();
    if (next != null) {
      print('Treating: ${next.name} (${next.condition})');
    } else {
      print('No patients waiting.');
    }
    return next;
  }

  Patient? checkNextPatient() {
    return _queue.peek();
  }

  int get waitingPatients => _queue.size;
}

void main() {
  final HospitalQueue hospital = HospitalQueue();

  // ผู้ป่วยมาถึงตามลำดับเวลา (ไม่ใช่ความรุนแรง)
  hospital.admitPatient(Patient('Alice', 'Broken arm', 4));
  hospital.admitPatient(Patient('Bob', 'Heart attack', 1));
  hospital.admitPatient(Patient('Carol', 'Headache', 5));
  hospital.admitPatient(Patient('David', 'Severe bleeding', 2));
  hospital.admitPatient(Patient('Eve', 'Chest pain', 2));

  print('\nNext patient: ${hospital.checkNextPatient()}');
  print('Waiting: ${hospital.waitingPatients} patients\n');

  // รักษาตามลำดับความรุนแรง (ไม่ใช่ลำดับการมาถึง)
  print('Treatment order:');
  while (hospital.waitingPatients > 0) {
    hospital.treatNextPatient();
  }
}
