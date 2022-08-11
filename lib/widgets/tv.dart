import 'package:flutter/material.dart';
import 'package:movies_app/description.dart';
import 'package:movies_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifyText(text:"Popular Tv Shows",size: 26,),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Description(
                            name: tv[index]['title'],
                            description: tv[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                            vote: tv[index]['vote_average'].toString(),
                            launch_on: tv[index]['release_date']))
                    );
                  },
                  child:
                  tv[index]['original_name']!= null ?Container(
                    padding:EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width:250,
                          height:140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage('https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],),
                                fit: BoxFit.cover,
                              ),
                          ),
                        ),
                        SizedBox(height:10),
                        Container(
                          child: ModifyText(
                              text: tv[index]['original_name'] != null
                                  ?tv[index]['original_name']
                                  :"Loading"),
                        ),
                      ],
                    ),
                  ): Container()
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
