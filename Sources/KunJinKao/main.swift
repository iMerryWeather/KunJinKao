import Foundation

func big5ToGBK(big5String : String) -> NSString {
    //convert big5 string which is stored in String(utf-8 enc.) to raw data
    let big5Enc = CFStringConvertEncodingToNSStringEncoding(
                        CFStringEncoding(CFStringEncodings.big5.rawValue))
    let big5Data = (big5String as NSString).data(using: big5Enc)!
    //convert big5 raw data to gbk nsstring
    let gbkEnc = CFStringConvertEncodingToNSStringEncoding(
                CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
    return NSString(data: big5Data, encoding: gbkEnc)!
}

let STARTUP_MSG =
"""
Usage:    kunjinkao
  -h, --help     display this message.
  -v, --version  print the kunjinkao version.
"""

var inputs = [String]()
while let input = readLine() {
    inputs.append(input)
}

for i in inputs {
    print(big5ToGBK(big5String: i))
}
