import 'dart:ui';

class KLSizeFit {
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double statusHeight;

  static double screenWidth;
  static double screenHeight;

  static double rpx;
  static double px;

  static void initialize() {
//手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    print("分辨率： $physicalWidth * $physicalHeight");

    

// 获取像素比
    final dpr = window.devicePixelRatio;

//宽和高
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    print("宽高： $screenWidth * $screenHeight");

// 状态栏高度
    statusHeight = window.padding.top / dpr;
    print("状态栏高度： $statusHeight");

//缩放比例
    rpx = screenWidth / 750;
  }

  static double setRpx(double size) {
    return rpx * size;
  }
}
