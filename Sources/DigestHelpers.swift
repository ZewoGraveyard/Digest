// Originally based on CryptoSwift by Marcin Krzyżanowski <marcin.krzyzanowski@gmail.com>
// Copyright (C) 2014 Marcin Krzyżanowski <marcin.krzyzanowski@gmail.com>
// This software is provided 'as-is', without any express or implied warranty.
//
// In no event will the authors be held liable for any damages arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
//
// - The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation is required.
// - Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
// - This notice may not be removed or altered from any source or binary distribution.

class DigestHelpers {
  static func rotateLeft(value:UInt8, count:UInt8) -> UInt8 {
      return ((value << count) & 0xFF) | (value >> (8 - count))
  }

  static func rotateLeft(value:UInt16, count:UInt16) -> UInt16 {
      return ((value << count) & 0xFFFF) | (value >> (16 - count))
  }

  static func rotateLeft(value:UInt32, count:UInt32) -> UInt32 {
      return ((value << count) & 0xFFFFFFFF) | (value >> (32 - count))
  }

  static func rotateLeft(value:UInt64, count:UInt64) -> UInt64 {
      return (value << count) | (value >> (64 - count))
  }

  static func rotateRight(value:UInt16, count:UInt16) -> UInt16 {
      return (value >> count) | (value << (16 - count))
  }

  static func rotateRight(value:UInt32, count:UInt32) -> UInt32 {
      return (value >> count) | (value << (32 - count))
  }

  static func rotateRight(value:UInt64, count:UInt64) -> UInt64 {
      return ((value >> count) | (value << (64 - count)))
  }

  static func reverseBytes(value: UInt32) -> UInt32 {
      return ((value & 0x000000FF) << 24) | ((value & 0x0000FF00) << 8) | ((value & 0x00FF0000) >> 8)  | ((value & 0xFF000000) >> 24);
  }


  static func arrayOfBytes<T>(value:T, length:Int? = nil) -> [UInt8] {
      let totalBytes = length ?? sizeof(T)

      let valuePointer = UnsafeMutablePointer<T>(allocatingCapacity: 1)
      valuePointer.pointee = value

      let bytesPointer = UnsafeMutablePointer<UInt8>(valuePointer)
      var bytes = [UInt8](repeating: 0, count: totalBytes)
      for j in 0..<min(sizeof(T),totalBytes) {
          bytes[totalBytes - 1 - j] = (bytesPointer + j).pointee
      }

      valuePointer.deinitialize(count: 1)
      valuePointer.deallocateCapacity(1)

      return bytes
  }

  static func toUInt32Array(slice: ArraySlice<UInt8>) -> Array<UInt32> {
      var result = Array<UInt32>()
      result.reserveCapacity(16)
      for idx in stride(from: slice.startIndex, to: slice.endIndex, by: sizeof(UInt32)) {
          let val1:UInt32 = (UInt32(slice[idx.advanced(by: 3)]) << 24)
          let val2:UInt32 = (UInt32(slice[idx.advanced(by: 2)]) << 16)
          let val3:UInt32 = (UInt32(slice[idx.advanced(by: 1)]) << 8)
          let val4:UInt32 = UInt32(slice[idx])
          let val:UInt32 = val1 | val2 | val3 | val4
          result.append(val)
      }

      return result
  }
}
