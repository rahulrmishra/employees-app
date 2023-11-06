class AppImages {
  static const String imagesPath = 'assets/images/';
  static String imagePath(String imageName) => '$imagesPath$imageName';

  static String noEmployeesFound =
      imagePath('no_employee_record_found_icon.png');
  static String personIcon = imagePath('person_icon.png');
  static String briefcase = imagePath('briefcase_icon.png');
  static String dropdown = imagePath('dropdown_icon.png');
  static String delete = imagePath('delete_icon.png');
}
