import 'package:cloud_firestore/cloud_firestore.dart';

import 'sub.dart';

final CollectionReference myCollection = FirebaseFirestore.instance.collection('syllabus');

class FirestoreService {
  
  Future<Subject> createSubjectList(String subjectname) async {
      final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final Subject subject = new Subject(subjectname);
      final Map<String, dynamic> data = subject.toMap();
      
       tx.set(ds.reference, data);
      return data;
    };

    return FirebaseFirestore.instance.runTransaction(createTransaction).then((mapData) {
      return Subject.fromMap(mapData);
    }).catchError((error) {
      return null;
    });
  }

  Stream<QuerySnapshot> getSubjectList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}