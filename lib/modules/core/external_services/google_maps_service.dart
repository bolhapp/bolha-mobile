import 'package:dio/dio.dart';

class IPlacesApiSuggestions {
  final String description;
  final String placeId;
  final String reference;

  const IPlacesApiSuggestions({
    required this.description,
    required this.placeId,
    required this.reference,
  });
  factory IPlacesApiSuggestions.fromJson(dynamic data) {
    return IPlacesApiSuggestions(
      description: data['description'],
      placeId: data['place_id'],
      reference: data['reference'],
    );
  }
}

Future<List<IPlacesApiSuggestions>?> getPlacesApiSuggestions(String input, String sessionToken) async {
  const String placesApiKey = "AIzaSyDcDjkD-MiE1kTP_WzMwUK7I8iO52kwxgU";
  final Dio dio = Dio();

  try {
    String baseURL =
        'https://f2a8350e-31e5-4952-b8f1-d9818b7ba6f2.mock.pstmn.io/locations_example';
    /*   String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
 */
    String request =
        '$baseURL?input=$input&key=$placesApiKey&sessiontoken=$sessionToken';
    Response<Map<String, dynamic>> response =
        await dio.get<Map<String, dynamic>>(Uri.parse(request).toString());

    if (response.data!['predictions'] != null) {
      List<IPlacesApiSuggestions> data = [];
      for(var place in  response.data!['predictions']) {
        data.add(IPlacesApiSuggestions.fromJson(place));
      }
      return data;
    } else {
      throw Exception('Failed to load predictions');
    }
  } catch (e) {
   // TODO: Handle error
  }

  return null;
}
