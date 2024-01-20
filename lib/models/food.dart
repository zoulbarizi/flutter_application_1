class Food {
  final String title, subtitle, details;
  final String? image;
  final int stars;
  final bool favorit;

  Food(
      {required this.title,
      required this.subtitle,
      required this.details,
      this.image,
      required this.stars,
      required this.favorit});
}

List<Food> myFoods = [
  Food(
    title: "Riz vert",
    subtitle: "subtitle",
    details: "sdl kfjskldfhklsdhfois dskgjdsjuopez sdkljf  ",
    stars: 5,
    favorit: true,
    image:
        "https://img.cuisineaz.com/660x660/2014/02/24/i71813-risotto-vert-a-la-vague-vegetarien.jpg",
  ),
  Food(
    title: "Riz noir",
    subtitle: "subtitle",
    details: "sdl kfjskldfhklsdhfois dskgjdsjuopez sdkljf  ",
    stars: 5,
    favorit: true,
    image:
        "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F166ce1c3-9452-4422-94e0-9c8c7ddc0090.2Ejpeg/750x562/quality/80/crop-from/center/cr/wqkgTGF1cmVudCBSb3V2cmFpcy9QcmlzbWFwaXggLyBDdWlzaW5lIEFjdHVlbGxl/salade-de-riz-noir-a-la-grenade-et-aux-pignons.jpeg",
  ),
  Food(
    title: "Riz au gras",
    subtitle: "subtitle",
    details: "sdl kfjskldfhklsdhfois dskgjdsjuopez sdkljf  ",
    stars: 4,
    favorit: false,
    image:
        "https://img.freepik.com/free-photo/big-sandwich-hamburger-with-juicy-beef-burger-cheese-tomato-red-onion-wooden-table_2829-19631.jpg",
  ),
  Food(
    title: "Riz bleu",
    subtitle: "subtitle",
    details: "sdl kfjskldfhklsdhfois dskgjdsjuopez sdkljf  ",
    stars: 4,
    favorit: true,
    image:
        "https://static.750g.com/images/1200-675/ea621fd21d03206d1b53937c1400f089/risotto-bleu-au-roquefort-et-aux-poires.jpeg",
  ),
];
