// ignore_for_file: constant_identifier_names



import 'package:cloud_firestore/cloud_firestore.dart';

class Globals {

  // Date formats
  static const DD_MMM_YYYY = "dd MMM yyyy";

  static CollectionReference userTableData = FirebaseFirestore.instance.collection('Users');


}
