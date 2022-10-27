class ProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final String siteImage;
  final String siteName;

  ProductModel(
      {required this.imageUrl,
      required this.name,
      required this.price,
      this.siteImage = '',
      this.siteName = ''});

  @override
  String toString() {
    return 'ProductModel{name: $name, imageUrl: $imageUrl, price: $price, siteImage: $siteImage}';
  }

  factory ProductModel.fromJsonJumia(dynamic json) {
    final name = json['name'];
    final imageUrl = json['image'];
    print(
        'price.............:${((json['price'] as String).split(' ').first.replaceAll(',', ''))}');
    final price = (double.parse(
        (json['price'] as String).split(' ').first.replaceAll(',', '')));
    return ProductModel(
        imageUrl: imageUrl,
        name: name,
        price: price,
        siteImage: 'https://encrypted-tbn0.gstatic.com/images?q='
            'tbn:ANd9GcQfhMiowuNqE46BIhLuvsB3w3iFcgRgx7YptU4ERcHnxYTj5UtR5rlQkDbMfdXX83LpWiw&usqp'
            '=CAU',
        siteName: 'Jumia');
  }

  factory ProductModel.fromJsonAliExpress(dynamic json) {
    final name = json['product_title'];
    final imageUrl = json['product_main_image_url'];
    final price = json['app_sale_price'];
    return ProductModel(
        imageUrl: imageUrl,
        name: name,
        price: getDouble(price),
        siteImage:
            'https://cdn4.arabiccoupon.com/sites/default/files/styles/icon_image/'
            'public/store_icon/aliexpress-logo-en-arabiccoupon'
            '-aliexpress-coupons-and-promo-codes-400x400.jpg',
        siteName: 'AliExpress');
  }
}

double getDouble(dynamic number) {
  if (number is double) {
    return number;
  } else if (number is int) {
    return number.toDouble();
  } else {
    return number;
  }
}
