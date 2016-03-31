class Base64 {

  private static let characterCodes = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","+","/","="]

  static func encode(string: String) -> String {
      let bytes = [UInt8](string.utf8)

      var out = ""
      var b : UInt8
      var i = 0
      while (i < bytes.count) {

        b = (bytes[i] & 0xFC) >> 2
        out += characterCodes[Int(b)]
        b = (bytes[i] & 0x03) << 4

        if i + 1 < bytes.count {
          b |= (bytes[i + 1] & 0xF0) >> 4
          out += characterCodes[Int(b)]
          b = (bytes[i + 1] & 0x0F) << 2
          if i + 2 < bytes.count {
            b |= (bytes[i + 2] & 0xC0) >> 6
            out += characterCodes[Int(b)]
            b = bytes[i + 2] & 0x3F
            out += characterCodes[Int(b)]
          }
          else {
            out += characterCodes[Int(b)]
            out += "="
          }
        }
        else {
          out += characterCodes[Int(b)]
          out += "=="
        }

        i += 3
      }

      return out
  }
}
