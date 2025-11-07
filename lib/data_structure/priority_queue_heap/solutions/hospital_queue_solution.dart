// เฉลย: Hospital Emergency Queue

import '../priority_queue.dart';

class Patient {
  final String name;
  final String condition;
  final int severity;

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

  Patient? checkNextPatient() => _queue.peek();
  int get waitingPatients => _queue.size;
}

void main() {
  final HospitalQueue hospital = HospitalQueue();

  hospital.admitPatient(Patient('Alice', 'Broken arm', 4));
  hospital.admitPatient(Patient('Bob', 'Heart attack', 1));
  hospital.admitPatient(Patient('Carol', 'Headache', 5));
  hospital.admitPatient(Patient('David', 'Severe bleeding', 2));
  hospital.admitPatient(Patient('Eve', 'Chest pain', 2));

  print('\nTreatment order:');
  while (hospital.waitingPatients > 0) {
    hospital.treatNextPatient();
  }
}
