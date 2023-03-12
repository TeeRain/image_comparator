// ignore: public_member_api_docs
class Messages {
  /// App title
  static const String title = 'Image Comparator';
  /// Clear
  static const String clear = 'clear';
  /// Compare
  static const String compare = 'compare';
  /// Compare diff result by size
  static const String resultSize = 'These are two different images by size';
  /// Compare diff result by pixels
  static const String resultDiff = 'These are two different images by pixels';
  /// Compare result equal
  static const String resultSame = 'These are two identical images';
  /// Compare result says that images are not picked
  static const String resultEmpty = 'One or both images are not picked';

  // static const String selectImages = 'Please select two images';
  /// 1st index
  static const firstImageIndex = 1;
  /// 2nd index
  static const secondImageIndex = 2;
  /// image max size
  static const double maxSize = 1800;
  ///const coefficient of width 
static const double widthFactor = 0.4;
///const coefficient of height 
static const double heightFactor = 0.7;
}
