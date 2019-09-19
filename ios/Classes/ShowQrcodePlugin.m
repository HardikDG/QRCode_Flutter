#import "ShowQrcodePlugin.h"
#import <show_qrcode/show_qrcode-Swift.h>

@implementation ShowQrcodePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftQrcodePlugin registerWithRegistrar:registrar];
}
@end
