import 'package:hive/hive.dart';
import 'package:tontonanku/feature/movie_list/movie_list.dart';

class MovieAdapter implements TypeAdapter<Movie> {
  @override
  Movie read(BinaryReader reader) {
    return Movie(
      posterPath: reader.readString(),
      title: reader.readString(),
      releaseDate: reader.readString(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.write(obj.posterPath);
    writer.write(obj.title);
    writer.write(obj.releaseDate);
  }
}
