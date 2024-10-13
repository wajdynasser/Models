class ListInfo {
  String pathImage;
  String infoProduct;
  String navImage;

  ListInfo({required this.pathImage,required this.infoProduct,required this.navImage});


}

class ListItem{
  List<ListInfo> items=[
   ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'Najm',
     navImage: "assets/images/img.png"

   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'anter',
        navImage: "assets/images/img.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'ebrahim',
        navImage: "assets/images/img.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'khalied',
        navImage: "assets/images/img_1.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'rafat',
        navImage: "assets/images/img.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'Tarq',
        navImage: "assets/images/img.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'mohammed',
        navImage: "assets/images/img.png"
   ), ListInfo(
     pathImage:'assets/images/img.png',
     infoProduct: 'ali',
        navImage: "assets/images/img.png"
   ),
  ];

}