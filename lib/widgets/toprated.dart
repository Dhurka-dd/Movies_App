import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({super.key, required this.topRated});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyText(text:"Top Rated Movies",size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Description(
                            name: topRated[index]['title'],
                            description: topRated[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                            vote: topRated[index]['vote_average'].toString(),
                            launch_on: topRated[index]['release_date']))
                    );
                  },
                  child:
                  topRated[index]['title']!=null ?Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage('https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path']))
                          ),
                        ),
                        Container(
                          child: ModifyText(
                              text: topRated[index]['title'] != null
                                  ?topRated[index]['title']
                                  :"Loading"),
                        ),
                      ],
                    ),
                  ) :Container()
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
