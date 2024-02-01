// programacao funcional
// programacao orientada a objetos

// classe selada, nao pode ser extendida
sealed class Either<L, R> {}

// tipos gerenicos
class Left<L, R> extends Either<L, R>{
  final L value;

  Left(this.value);
}

class Right<L, R> extends Either<L, R> {
  final L value;

  Right(this.value);
}
