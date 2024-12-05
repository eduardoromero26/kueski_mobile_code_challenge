import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kueski_mobile_code_challenge/domain/models/movie_detail_model.dart';

class SliverAppBarMovieDetails extends StatelessWidget {
  final MovieDetails selectedMovie;

  const SliverAppBarMovieDetails({super.key, required this.selectedMovie});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SliverAppBar(
      backgroundColor: primaryColor,
      leading: IconButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(Colors.white),
        ),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.72,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: selectedMovie.id,
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/original${selectedMovie.posterPath}',
            fit: BoxFit.cover,
            placeholder: (context, url) => const SizedBox(
                height: 40, width: 40, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}