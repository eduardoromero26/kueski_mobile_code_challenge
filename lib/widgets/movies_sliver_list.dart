import 'package:flutter/material.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_model.dart';
import 'package:kueski_mobile_code_challenge/utils/route_screen_names.dart';

class MoviesSliverList extends StatelessWidget {
 final  MovieResponse movies;
  const MoviesSliverList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) { 
      return SliverSafeArea(
        bottom: true,
        minimum: const EdgeInsets.only(bottom: 8.0),
        sliver: SliverList.builder(
          addAutomaticKeepAlives: true,
          itemCount: movies.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  title: Text(
                      movies.results[index].title,
                      ),
                  subtitle: Text(
                      movies.results[index].releaseDate.toString(),
                      ),
                  leading: Hero(
                    tag: movies.results[index].id,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original${movies.results[index].posterPath}',
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.pushNamed(context, RouteScreenNames.details,
                        arguments: movies.results[index]);
                  },
                ),
              ),
            );
          },
        ),
      );
  }
}