sealed class AppViewState {
  const AppViewState();
}

class Idle extends AppViewState {
  const Idle();
}

class Loading extends AppViewState {
  const Loading();
}

class Empty extends AppViewState {
  const Empty();
}

class Success<T> extends AppViewState {
  const Success(this.data);
  final T data;
}

class Error extends AppViewState {
  const Error(this.message);
  final String? message;
}
