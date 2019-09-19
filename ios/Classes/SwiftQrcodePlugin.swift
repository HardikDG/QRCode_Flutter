import Flutter
import UIKit

public class SwiftQrcodePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "qrcode", binaryMessenger: registrar.messenger())
        let instance = SwiftQrcodePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "getPlatformVersion") {
            result("iOS " + UIDevice.current.systemVersion)
        } else if (call.method == "generateQRCode") {
            if let arg = call.arguments as? [String:String] {
                var text = arg["message"]
                DispatchQueue.main.async {
                    if text?.count == 0 {
                        text = "It worked!. Please pass the text from the dart file to check with real QRCode"
                    }
                    if let qr = self.generateQRCode(from: text!) {
                        result(qr)
                    }
                }
            } else {
                result(FlutterError(code: "400", message: "Invalid input", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented);
        }
    }
    
    
    func generateQRCode(from inputString: String) -> String? {
        
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        let qrData = inputString.data(using: String.Encoding.ascii)
        qrFilter.setValue(qrData, forKey: "inputMessage")
        
        let qrTransform = CGAffineTransform(scaleX: 12, y: 12)
        if let qrImage = qrFilter.outputImage?.transformed(by: qrTransform) {
            let newImage = convert(cmage: qrImage)
            let imageData = UIImagePNGRepresentation(newImage)
            let guid = ProcessInfo.processInfo.globallyUniqueString;
            let tmpFile = String(format: "image_picker_%@.png", guid);
            let tmpDirectory = NSTemporaryDirectory();
            let tmpPath = (tmpDirectory as NSString).appendingPathComponent(tmpFile);
            print(tmpPath);
            if(FileManager.default.createFile(atPath: tmpPath, contents: imageData, attributes: [:])) {
                return tmpPath;
            }
        }
        return nil
    }
    
    func convert(cmage:CIImage) -> UIImage
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
}
