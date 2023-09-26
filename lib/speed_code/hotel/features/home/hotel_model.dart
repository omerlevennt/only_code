class HotelModel {
  final String title;
  final String location;
  final int price;

  HotelModel(
      {required this.title, required this.location, required this.price});

  static final List<HotelModel> hotelItems = [
    HotelModel(
        title: 'Mavar Mevati Hotel', location: 'South tang, Banten', price: 99),
    HotelModel(
        title: 'Mavar Mevati Hotel', location: 'South , Banten', price: 160),
    HotelModel(
        title: 'Mavar Mevati Hotel', location: 'Sout, Banten', price: 120),
  ];
}
