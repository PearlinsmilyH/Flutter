void main() async {
  print('Start of program');
  await delayedPrint('Hello, ', Duration(seconds: 2));
  await delayedPrint('async ', Duration(seconds: 2));
  await delayedPrint('and ', Duration(seconds: 2));
  await delayedPrint('await!', Duration(seconds: 2));
  print('End of program');
}

Future<void> delayedPrint(String message, Duration duration) async {
  await Future.delayed(duration);
  print(message);
}
