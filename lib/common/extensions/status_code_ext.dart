extension StatusCodeExt on String {
  bool get is200 => this == '200'; // success
  bool get is400 => this == '400'; // client-side error
  bool get is401 => this == '401'; // wrong api key or your account suspended
  bool get is404 => this == '404'; // not found
  bool get is429 => this == '429'; // exceeding quota limit for free plan
  bool get is500 => this == '500'; // server-side error
}
