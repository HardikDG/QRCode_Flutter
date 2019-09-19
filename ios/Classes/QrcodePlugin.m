#import "QrcodePlugin.h"
#import <qrcode/qrcode-Swift.h>

@implementation QrcodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQrcodePlugin registerWithRegistrar:registrar];
}
@end
