class HybridEvent {
  String tag;
  String name;
  String hybrid;
  bool isOnline;
  String date;
  String hour;
  List<String> listHour;
  String type;
  int price;
  String description;
  String imageAsset;
  String hybridType;

  HybridEvent(
      {required this.tag,
      required this.name,
      required this.hybrid,
      required this.isOnline,
      required this.date,
      required this.hour,
      required this.listHour,
      required this.type,
      required this.price,
      required this.description,
      required this.imageAsset,
      required this.hybridType});
}

var onsiteEventList = [
  HybridEvent(
    tag: "skye",
    name: "SKYE Restaurant & Lounge",
    hybrid: "BCA Tower, Lt. 56, Jl. M.H. Thamrin No. 1, Menteng",
    isOnline: false,
    date: "Every Day",
    hour: "10:00 - 21:00",
    listHour: [
      "10:00 - 13:00",
      "13:00 - 16:00",
      "16:00 - 19:00",
      "19:00 - 21:00"
    ],
    type: "Restaurant",
    price: 50000,
    description:
        "South East Asia is quickly becoming one of the major hotspots for having the swankiest bars and restaurants in the world. And if you notice carefully, most of these restaurants and bars are not only notorious for hiring Michelin star chefs or Internationally acclaimed Mixologists, but they succeed in providing their guests with new dining experiences, and with regards to Skye, their location and view are definitely part of it. The Menara BCA has the 57th floor and is 230 meters high. Located on its 56th floor, SKYE's main attraction will obviously be the view of the city's skyline. Isn't it cool? SKYE occupies the entire top level of the building- creating an expansive space that incorporates on one-half of the floorplan an indoor Restaurant space of generous proportions with high ceilings and floor to ceiling glass walls; and on the other half, a spacious indoor/outdoor Lounge and terrace. The SKYE Lounge concept is to serve bistro style food and refreshments during the day, and in the evenings transition into a “lounge” format with cocktails and chill-out music.",
    imageAsset:
        'https://i.pinimg.com/564x/37/dc/be/37dcbe708a2c8433c6b5f7608301090c.jpg',
    hybridType:
        'https://i.pinimg.com/564x/25/73/60/257360090f31136c580695f7bee402df.jpg',
  ),
  HybridEvent(
    tag: "sushi",
    name: "Sushi Hiro",
    hybrid: "Ruko Garden House Blok B No. 18D",
    isOnline: false,
    date: "Every Weekend",
    hour: "12:00 - 18:00",
    listHour: ["12:00 - 14:00", "14:00 - 16:00", "16:00 - 18:00"],
    type: "Culinary",
    price: 10000,
    description:
        "Penasaran sama deretan sushi yang dihidangkan dengan wadah seperti tangga? Yes, kamu bisa mencobanya di Sushi Hiro. Bukan hanya penyajiannya yang menarik, sushi-sushi yang dihidangkan juga amat menggugah selera. Tapi kalau lagi nggak pengen sushi, kamu tentu bisa memesan Japanese food lainnya seperti Ultimate Truffle Gyu Don, Okonomiyaki, atau mungkin Saba Shioyaki Set Menu. Interior Sushi Hiro tentu juga nggak jauh dari unsur negara asalnya, yaitu serba kayu dan menggunakan paduan warna cokelat muda. Bahkan dari depan bangunan pun, kamu akan langsung dibuat terkesan dengan desainnya. Selain di Kelapa Gading, Sushi Hiro bisa kamu temukan di Senopati dan Pantai Indah Kapuk.",
    imageAsset:
        'https://i.pinimg.com/564x/c9/fd/cd/c9fdcd6c535b18372383830986fc6df7.jpg',
    hybridType:
        'https://i.pinimg.com/564x/25/73/60/257360090f31136c580695f7bee402df.jpg',
  ),
  HybridEvent(
    tag: "jakaq",
    name: "Jakarta Aquarium",
    hybrid: "Neo SOHO, Lt. LG 101 - LGM 101",
    isOnline: false,
    date: "Every Day",
    hour: "10:00 - 16:00",
    listHour: ["10:00 - 12:00", "12:00 - 14:00", "14:00 - 16:00"],
    type: "Activity",
    price: 195000,
    description:
        "Jakarta Aquarium, terletak di lantai LG dan LM Neo Soho Mall. Sebuah mall yang bisa dibilang masih baru, dekat dengan Central Park dan Mall Taman Anggrek. Jakarta Aquarium adalah indoor aquarium terbesar di Indonesia yang menjadi bagian dari Management Taman Safari Indonesia. Sesuai dengan namanya, ada berbagai jenis makhluk laut dan ikan-ikan tropis yang ada di dalam aquarium ini. Tentunya tempat ini pas banget, kalau kamu ingin mengajak keluarga berlibur sambil melihat dan mengenal jenis-jenis makhluk laut. Untuk kamu yang membawa bayi, jangan khawatir, tempat ini cukup luas sehingga kamu bisa membawa stroller dengan leluasa. Untuk kamu yang ingin mencoba pengalaman diving atau sea-walking, kamu juga bisa mencobanya di sini. Seru, kan? Yuk, berwisata ke sini!",
    imageAsset:
        'https://i.pinimg.com/564x/65/43/aa/6543aac02356113ccb729fafc28d763f.jpg',
    hybridType:
        'https://i.pinimg.com/564x/25/73/60/257360090f31136c580695f7bee402df.jpg',
  )
];

var onlineEventList = [
  HybridEvent(
    tag: "dcdg",
    name: "Peluang Karier Sebagai Blockchain Developer",
    hybrid: "Online - Youtube",
    isOnline: true,
    date: "28 April 2022",
    hour: "15:30 - 16:30",
    listHour: ["15:30 - 16:30"],
    type: "Education",
    price: 0,
    description:
        "Stay up-to-date dengan perkembangan teknologi industri saat ini. Jadikan hari-harimu lebih produktif dengan asah pengetahuan dan skill di Dicoding Event. Kali ini Dicoding LIVE disponsori oleh IDCamp dengan tema 'Peluang Karier Sebagai Blockchain Developer'. Ada yang mengatakan Blockchain adalah masa depan lebih dari sekedar mata uang. Saat ini ada banyak sekali konferensi Blockchain, acara jaringan Blockchain, dan lebih banyak lagi yang terjadi di seluruh dunia setiap tahun.Apakah kamu seorang seorang blockchain enthusiast, atau seseorang yang hanya tertarik untuk mempelajari lebih lanjut tentang teknologi penting ini? Apa pun tujuan kamu, tentu kita sebagai orang Indonesia tidak boleh hanya menjadi konsumen di negeri sendiri, tetapi kita harus menjadi pelaku dalam perkembangan teknologi.",
    imageAsset:
        'https://i.pinimg.com/564x/30/62/3a/30623adcfddc9557449d6a684ed867f5.jpg',
    hybridType:
        'https://i.pinimg.com/564x/1b/87/7f/1b877fc422ad6bf3e8bf9768fa8d966e.jpg',
  ),
  HybridEvent(
    tag: "indgo",
    name: "Understanding the Importance of UIUX for Digital Startup Products",
    hybrid: "Online - Zoom",
    isOnline: true,
    date: "13 Mei 2022",
    hour: "18:30 - 20:00",
    listHour: ["18:30 - 20:00"],
    type: "Education",
    price: 0,
    description:
        "Di sesi kali ini akan membahas tentang Understanding the Importance of UI/UX for Digital Startup Products yang akan dibawakan oleh Roby Habibullah, Senior Product Designer at Kumparan. Yuk ikutan dan cari tahu lebih dalam tentang berpikir strategis untuk berkreasi dan berinovasi dalam membangun suatu produk.",
    imageAsset:
        'https://i.pinimg.com/564x/7d/69/66/7d6966d850e66adc15ca3d132ce183b7.jpg',
    hybridType:
        'https://i.pinimg.com/564x/cd/8b/9f/cd8b9f844b12078115e4eabd4f98e1a5.jpg',
  ),
  HybridEvent(
    tag: "optm",
    name: "International Education Expo 2022",
    hybrid: "Online - GMeet",
    isOnline: true,
    date: "21 - 22 Mei 2022",
    hour: "10:00 - 17:00",
    listHour: ["10:00 - 17:00"],
    type: "Scholarship",
    price: 0,
    description:
        "Optima Education dengan bangga kembali menghadirkan INTERNATIONAL EDUCATION EXPO 2022 yang akan diselenggarakan secara VIRTUAL. Informasi tentang kampus, akomodasi hingga beasiswa potongan uang kuliah dapat kamu dapatkan dengan berpartisipasi dalam Pameran ini. Mohon maaf tidak ada beasiswa penuh. Untuk keperluan visa, anda / orangtua perlu memiliki tabungan minimal Rp 100 juta.",
    imageAsset:
        'https://i.pinimg.com/564x/5f/44/24/5f4424d79ac7952dae4747a7c967bc74.jpg',
    hybridType:
        'https://i.pinimg.com/564x/28/90/fe/2890fe8532ae2b8b63edd21d5d5cd67f.jpg',
  ),
];
