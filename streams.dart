Future<int> sumStream(Stream<int> stream) async {

  var sum = 0;

  await for (var value in stream) {
    sum += value;
  }
  
  return sum;
}

Future<void> main() async {

  final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  var lists = ["string", "c", "cpp"];

  var lop= Stream<String>.fromIterable(lists);

  final sum = await sumStream(stream);
  
  print('Sum: $sum');
}
