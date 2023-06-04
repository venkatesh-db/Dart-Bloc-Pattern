class streamlistener<T> {
  streamlistener.streamlistener() {}

  List<dynamic>? p;

  streamlistener<T> add(dynamic p1) {
    p?.add(p1);

    return this;
  }

  void then(dynamic p2) {
    p?.add(p2);
  }
}

void stream() {}

void main() {

  streamlistener<int>.streamlistener().add(() {
    print("any problem callaback me");
  }).then(() {
    print("any errors callaback me");
  });

  streamController.stream.listen(
  (event) => print('Event: $event'),
  onDone: () => print('Done'),
  onError: (error) => print(error),
);

}
