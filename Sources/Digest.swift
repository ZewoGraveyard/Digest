public func sha1(string: String) -> String {
    return SHA1.hash(from: string)
}

public func base64Encode(string: String) -> String {
    return Base64.encode(string)
}
