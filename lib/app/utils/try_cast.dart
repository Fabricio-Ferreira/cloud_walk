T? tryCast<T>(dynamic x) {
  if (x == null) return null;
  if (x is T) {
    return x;
  } else {
    return null;
  }
}
