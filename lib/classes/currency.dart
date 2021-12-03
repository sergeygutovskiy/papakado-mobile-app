class Currency {
    final String simbol;
    final int value;

    Currency(
        this.value, [
        this.simbol = ' ₽',
    ]);

    String get formatted {
        return value.toString() + simbol;
    }
}
