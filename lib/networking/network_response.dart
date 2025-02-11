class NetworkResponse<T> {
  NetworkResponse.success(this.data, {this.message, this.statusCode})
      : status = NetworkStatus.success;

  NetworkResponse.error(this.message, {this.data, this.statusCode})
      : status = NetworkStatus.error;

  final NetworkStatus? status;
  T? data;
  String? message;

  final int? statusCode;
}

enum NetworkStatus { loading, success, error, exception }
