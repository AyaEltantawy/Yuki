abstract class CartState {}

class CartStateInit extends CartState {}

class ToggleCheck extends CartState {}

class FetchCartLoadingState extends CartState {}

class FetchCartSuccessState extends CartState {}

class FetchCartErrorState extends CartState {}

class DeleteProductLoadingState extends CartState {}

class DeleteProductSuccessState extends CartState {}

class DeleteProductErrorState extends CartState {}

class Increment extends CartState {}

class Decrement extends CartState {}
