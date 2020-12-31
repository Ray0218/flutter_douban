import 'http_requet.dart';

class KLHomeConfig {}

class KLHomeRequest {
  static    rGetMovieList(int start)  {
    final movieUrl = "/movie/top250?start=$start&count=20";

       HttpRequest.request(movieUrl).then((value) {


         print("#######") ;
         
         print(value) ;

       });
  }
}
