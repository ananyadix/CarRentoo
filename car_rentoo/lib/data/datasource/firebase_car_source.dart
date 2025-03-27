import 'package:car_rentoo/data/model/Car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarSource{
    final FirebaseFirestore firestore;
    FirebaseCarSource({required this.firestore});
    Future<List<Car>> getCar() async{
      var snapshot=await firestore.collection('cars').get();
      return snapshot.docs.map((doc)=>Car.fromMap(doc.data())).toList();
    }
}