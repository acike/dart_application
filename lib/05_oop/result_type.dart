/// Represents the outcome of an operation that can either succeed with a value
/// of type [T] or fail with an error of type [Object].
///
/// This is a common pattern to avoid using exceptions for control flow or
/// relying on nullable types to indicate failure.
abstract class Result<T> {
  /// Private constructor to prevent direct instantiation or extension
  /// outside of this library's control.
  const Result._();

  /// Factory constructor to create a [Success] result.
  ///
  /// Takes the successful [value] of type [T].
  factory Result.success(T value) = Success<T>;

  /// Factory constructor to create a [Failure] result.
  ///
  /// Takes the [error] object, typically an [Exception] or [Error].
  factory Result.failure(Object error) = Failure<T>;

  /// Returns `true` if this result is a [Success].
  bool get isSuccess;

  /// Returns `true` if this result is a [Failure].
  bool get isFailure;

  /// Allows handling both success and failure cases using callbacks.
  ///
  /// Provides a functional way to extract the value or handle the error.
  /// Example:
  /// ```dart
  /// result.when(
  ///   success: (value) => print('Got value: \$value'),
  ///   failure: (error) => print('Got error: \$error'),
  /// );
  /// ```
  R when<R>({
    required R Function(T value) success,
    required R Function(Object error) failure,
  });

  /// Gets the value if the result is a [Success], otherwise throws [StateError].
  /// Use [isSuccess] to check before calling this, or use [when].
  T get valueOrThrow {
    if (this is Success<T>) {
      return (this as Success<T>).value;
    } else {
      throw StateError(
        'Cannot get value from a Failure result: ${(this as Failure<T>).error}',
      );
    }
  }

  /// Gets the error if the result is a [Failure], otherwise throws [StateError].
  /// Use [isFailure] to check before calling this, or use [when].
  Object get errorOrThrow {
    if (this is Failure<T>) {
      return (this as Failure<T>).error;
    } else {
      throw StateError('Cannot get error from a Success result');
    }
  }
}

/// Represents a successful result containing a [value] of type [T].
class Success<T> extends Result<T> {
  /// The successful value.
  final T value;

  /// Creates a [Success] instance with the given [value].
  const Success(this.value) : super._();

  @override
  bool get isSuccess => true;

  @override
  bool get isFailure => false;

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(Object error) failure,
  }) {
    // Calls the success callback with the value.
    return success(value);
  }
}

/// Represents a failure result containing an [error].
class Failure<T> extends Result<T> {
  /// The error object, typically an [Exception] or [Error].
  final Object error;

  /// Creates a [Failure] instance with the given [error].
  const Failure(this.error) : super._();

  @override
  bool get isSuccess => false;

  @override
  bool get isFailure => true;

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(Object error) failure,
  }) {
    // Calls the failure callback with the error.
    return failure(error);
  }
}

// --- Example Usage ---
void main() {
  // Example function that might succeed or fail
  Result<int> divide(int a, int b) {
    if (b == 0) {
      return Result.failure(ArgumentError('Cannot divide by zero'));
    } else {
      return Result.success(a ~/ b); // Use integer division
    }
  }

  final result1 = divide(10, 2);
  final result2 = divide(10, 0);

  print('--- Processing result1 (Success) ---');
  if (result1.isSuccess) {
    print('Division successful!');
    // Safely access value after checking isSuccess
    print('Value: ${result1.valueOrThrow}');
  } else {
    print('Division failed: ${result1.errorOrThrow}');
  }

  // Using 'when' for result1
  String message1 = result1.when(
    success: (value) => 'Result 1 is a success with value: $value',
    failure: (error) => 'Result 1 is a failure with error: $error',
  );
  print(message1);

  print('\\n--- Processing result2 (Failure) ---');
  if (result2.isFailure) {
    print('Division failed!');
    // Safely access error after checking isFailure
    print('Error: ${result2.errorOrThrow}');
  } else {
    print('Division successful: ${result2.valueOrThrow}');
  }

  // Using 'when' for result2
  String message2 = result2.when(
    success: (value) => 'Result 2 is a success with value: $value',
    failure: (error) => 'Result 2 is a failure with error: $error',
  );
  print(message2);

  // Example with a different type
  Result<String> fetchData(bool succeed) {
    if (succeed) {
      return Result.success('Data fetched successfully!');
    } else {
      return Result.failure(Exception('Network error'));
    }
  }

  final dataResult = fetchData(false);
  dataResult.when(
    success: (data) => print('\\nData: $data'),
    failure: (error) => print('\\nError fetching data: $error'),
  );
}
