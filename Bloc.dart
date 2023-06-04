//Most of the time, this comes from the fact
//that you switched from one Page (= Route)
//to another, using the Navigator.

//So, when you click the Search icon on the
// HomePage, you are redirected to the
//SearchPage and the line: “MyBloc bloc = BlocProvider.of(context)” returns null…

//Why is this?

// In order to understand, you need to keep
// in mind how Flutter handles the
// Pages (= Route)

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MyBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Home Page'), actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPress: () {
                Navigator.of(context).pushNamed('/searchPage');
              }),
        ]),
        body: Container(),
      ),
    );
  }
}

// When you are instantiating a MaterialApp, in fact, Flutter creates
// a series of Widgets you usually do not need to worry about and one of them is an Overlay.

//This Overlay has a Stack as a descendant. This Stack will be used
//to “stack” the Pages (something like to put them one on top of
//the other).

//The following schema shows a very simplified view of the hierarchy,
// which results from the code here above://

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyBloc bloc = BlocProvider.of<MyBloc>(context);

    return Container();
  }
}

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBloc>(
      bloc: MyBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class MyBloc implements BlocBase {
  @override
  void dispose() {
    //...
  }

  // -------  SINGLETON ------
  static final MyBloc _instance = MyBloc._internal();
  factory MyBloc() => _instance;
  MyBloc._internal();
}

MyBloc myBloc = MyBloc();


















//Refernces :
//https://www.didierboelens.com/2019/04/blocprovider.ofcontext-returns-null/

// https://www.didierboelens.com/2018/12/reactive-programming-streams-bloc-practical-use-cases/
// https://www.didierboelens.com/2018/12/reactive-programming-streams-bloc-practical-use-cases/
// https://www.didierboelens.com/2018/08/reactive-programming-streams-bloc/
//https://www.didierboelens.com/2019/04/blocprovider.ofcontext-returns-null/
// https://www.didierboelens.com/2019/04/bloc-scopedmodel-redux-comparison/
