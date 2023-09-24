class HotelModel {
  final String title;
  final String location;
  final double price;

  HotelModel(
      {required this.title, required this.location, required this.price});

  List<HotelModel> hotelItems = [
    HotelModel(
        title: 'Mavar Mevati Hotel', location: 'South tang, Banten', price: 99),
  ];
}
