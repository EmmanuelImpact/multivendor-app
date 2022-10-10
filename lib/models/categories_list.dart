class MainCategoryModel {
  final String title;
  bool isSelected;

  MainCategoryModel({
    required this.title,
    this.isSelected = false,
  });
}

List<MainCategoryModel> mainCategoryList = [
  MainCategoryModel(title: 'Men'),
  MainCategoryModel(title: 'Women'),
  MainCategoryModel(title: 'Electronics'),
  MainCategoryModel(title: 'Kids'),
  MainCategoryModel(title: 'Groceries'),
  MainCategoryModel(title: 'Utensils'),
  MainCategoryModel(title: 'Upholstery'),
];

List<String> menSubCategory = [
  'Blue shirt',
  'Cyan shirt',
  'Hard collar',
  'White shirt',
  'Colored shirt',
  'Complete outfit',
  'Blue shirt',
  'Long sleeve',
  'Modern-guy',
  'Striped shirt',
  'Multi-colored shirt',
  'Dotted shirt',
];

List<String> womenSubCategory = [
  'Long Gown',
  'Epic combo',
  'Blue Gown',
  'Blue Snickers',
  'Stilleto',
  'Shorts',
  'Unisex Palm',
  'Slippers',
  'Necklace',
  'Yellow Skirt',
  'Yellow Top',
  'Heels',
  'Blue Snickers',
  'Beauty Parade',
  'Red Skirt',
];

List<String> electSubCategory = [
  'Speakers',
  'Remote Control',
  'Game Pad',
  'Plasma TV',
  'White Earpod',
  'Head Phone',
  'Clipper',
  'Black Epic Earpod',
  'Black Earpod',
  'Earpiece',
  'White Head Phone',
  'Coputer Mouse',
  'Air Conditioner',
  'Pressing Iron',
  'Rounded-Base Pressing Iron',
];

List<String> kidsSubCategory = [
  'Dummy briefcase',
  'Teddy bear',
  'Glowing Teddy bear',
  'Napkin',
  'Bicycle',
  'Learn Your Alphabets',
  'Suckers',
  'School bag',
  'Giraffe toy',
  'Pink School bag',
  'Shoe',
  'Black shoe',
  'Bottle',
  'Pink Wrist-watch',
  'Light-pink Wrist-watch',
];

List<String> groceriesSubCategory = [
  'Full package',
  'Milo',
  'Rice',
  'Power Oil',
  'Mackerel Tin fish',
  'Golden Morn',
  'Nutri-C',
  'Nescafe',
  'Chocolate',
  'Louis Rice',
  'Sardin',
  'Kings Oil',
  'Beans Flour',
  'Chocolate for bread',
  'Omo detergent',
];

List<String> utensilsSubCategory = [
  'Spoon set',
  'Cutleries',
  'Cutleries',
  'Complete combo',
  'Pot set',
  'Mortal & Pestle',
  'Pressure cookers',
  'Plastic spoon set',
  'Plate rack',
  'Pots & Spoons',
  'Plate rack',
  'Pots',
  'Rack',
  'Pots',
  'Installed Gas Cooker',
];

List<String> upholsterySubCategory = [
  'Single sofa',
  'Sofa for 1',
  'Blue sofa',
  'Sofa sets',
  'Sofa sets',
  'Sofa for 2',
  'Red sofa for 2',
  'Chairs',
  'Wooden leg chair',
  'center table',
  'Flat sofa',
  'Single chair',
  'Catchy sofa',
  'Complete sofa set',
  'Interior decor sofa',
];
