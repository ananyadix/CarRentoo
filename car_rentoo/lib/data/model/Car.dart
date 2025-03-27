class Car {
  String model;
  int distance;
  int fuelCapacity;
  int pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromMap(Map<String,dynamic> map){
    return Car(
      model: map['model'],
      distance: map['distance'],
      fuelCapacity: map['fuelCapacity'],
      pricePerHour: map['pricePerHour']
    );
  }
}