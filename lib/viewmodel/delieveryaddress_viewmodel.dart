import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';
class DeliveryAddressViewModel with ChangeNotifier
{
  var mycontroller        = TextEditingController();
  String delieverylocation = "Pakistan";
  var uuid                 = const Uuid();
  String _sessionToken     = '1234567890';
  List<dynamic> placeList  = [];

  updatedlocation(value)
  {
    delieverylocation = value;
    notifyListeners();
  }

  onChanged() {
    if (_sessionToken == null) {
        _sessionToken = uuid.v4();
        notifyListeners();
    }
    getSuggestion(mycontroller.text);
  }

  void getSuggestion(String input) async {


    String kPLACES_API_KEY = "AIzaSyDijvS2eb4gKDXDg4iWT8epFjLuJ8-2-Xs";


    try{
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
          placeList = json.decode(response.body)['predictions'];
          notifyListeners();
      } else {
        throw Exception('Failed to load predictions');
      }
    }catch(e){
     e.toString();
    }

  }


}