
public class Digest {

  public static func sha1(string: String) -> String {
    return SHA1.hash(from: string)
  }

}
