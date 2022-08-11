import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import 'package:movies_app/widgets/toprated.dart';
import 'package:movies_app/widgets/trending.dart';
import 'package:movies_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        brightness:Brightness.dark,
        primaryColor:Colors.grey,
      ),
      home: MoviesPage(),
    );
  }
}

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {

 List trendingMovies = [];
 List topRatedMovies = [];
 List tv = [];

 final String apiKey = '3d1987c9b4114810929c8573c0fc73fa';
 final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDE5ODdjOWI0MTE0ODEwOTI5Yzg1NzNjMGZjNzNmYSIsInN1YiI6IjYyZTNmYzk2ODU3MDJlMDA1ODQ2MTAzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6CnJGZrIk50vjiTs8HEPtvxjeLkf4VovBw8Dpm4nuM4';

 @override
 void initState(){
   loadMovies();
   super.initState();
 }


 loadMovies() async{
   TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
   logConfig: ConfigLogger(
     showLogs: true,
     showErrorLogs: true,
   ));
   Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
   Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
   Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

   setState((){
     trendingMovies = trendingResult['results'];
     topRatedMovies = topRatedResult['results'];
     tv = tvResult['results'];
   });
   print(tv);
 }

 @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        title:ModifyText(text:"Movies App",),
      ),
      body: ListView(
        children: [
          TV(tv:tv),
          SizedBox(height:5),
          TopRated(topRated: topRatedMovies,),
          SizedBox(height:5),
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
