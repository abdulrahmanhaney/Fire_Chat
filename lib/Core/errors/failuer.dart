abstract class Failuer {
  final String errorMessage;
  Failuer(this.errorMessage);
}

class FirebaseFailuer extends Failuer {
  FirebaseFailuer(super.errorMessage);
}
