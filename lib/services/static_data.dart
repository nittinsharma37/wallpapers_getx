


import '../model/catogeriesModel.dart';

//pexels api key here
String apiKey = "563492ad6f91700001000001e61981db533546788e2173c6362e3049";

List<CatogeriesModel> getCatogeries() {
  //////////////////////////////
  List<CatogeriesModel> catogeries = [];
  CatogeriesModel catogeriesModel =  CatogeriesModel();

  

  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/96381/pexels-photo-96381.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "All";
  catogeries.add(catogeriesModel);
  catogeriesModel = CatogeriesModel();

  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/96381/pexels-photo-96381.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Abstract";
  catogeries.add(catogeriesModel);
  catogeriesModel = CatogeriesModel();


   catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/2387873/pexels-photo-2387873.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Nature";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  //////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/70080/elephant-africa-african-elephant-kenya-70080.jpeg?cs=srgb&dl=pexels-pixabay-70080.jpg&fm=jpg";
  catogeriesModel.catogeriesName = "Wild Life";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  catogeriesModel.catogeriesUrl = 
  "https://images.pexels.com/photos/45853/grey-crowned-crane-bird-crane-animal-45853.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  catogeriesModel.catogeriesName = "Birds";
  catogeries.add(catogeriesModel);
  catogeriesModel = CatogeriesModel();

  //////////////
 


  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/847393/pexels-photo-847393.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Aquatic Life";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();


  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/2103127/pexels-photo-2103127.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Street Art";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  //////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/1121782/pexels-photo-1121782.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "City";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  ///////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/546819/pexels-photo-546819.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Tech";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  //////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/4792509/pexels-photo-4792509.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Motivation";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  //////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/2747540/pexels-photo-2747540.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Bikes";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  //////////////
  catogeriesModel.catogeriesUrl =
      "https://images.pexels.com/photos/2710043/pexels-photo-2710043.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  catogeriesModel.catogeriesName = "Cars";
  catogeries.add(catogeriesModel);
  catogeriesModel =  CatogeriesModel();

  return catogeries;
}
