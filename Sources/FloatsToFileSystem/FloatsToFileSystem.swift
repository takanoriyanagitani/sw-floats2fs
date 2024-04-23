import Foundation

public func data2url(dat: Foundation.Data, filename: Foundation.URL) throws {
  try dat.write(to: filename, options: [])
}

public func data2file<D>(dataLike: D, file: Foundation.FileHandle) throws
where D: Foundation.DataProtocol {
  try file.write(contentsOf: dataLike)
}

public func floats2bytes2file(
  floats: [Float32],
  file: Foundation.FileHandle
) throws {
  try floats.withUnsafeBytes {
    let bytes: UnsafeRawBufferPointer = $0
    try data2file(dataLike: bytes, file: file)
  }
}

public func pointer2file(
  raw: UnsafeRawPointer,
  byteSize: Int,
  file: Foundation.FileHandle
) throws {
  let buf: UnsafeRawBufferPointer = UnsafeRawBufferPointer(
    start: raw,
    count: byteSize
  )
  try data2file(dataLike: buf, file: file)
}

/// An "fsync"(flush; OS buffer -> storage)
public func fsyncDefault(file: Foundation.FileHandle) throws {
  try file.synchronize()
}

/// A dummy "fsync"(does nothing)
public func fsyncNop(file: Foundation.FileHandle) throws {}

/// Saves float values to the specified URL and sync using specified fsync.
///
/// - Parameters:
///   - floats: The float values to save
///   - url: The url(filename) to use for saving the float values
///   - fsync: The func to use as "sync"(default: fsync)
public func floats2bytes2url(
  floats: [Float32],
  url: Foundation.URL,
  fsync: (Foundation.FileHandle) throws -> Void = fsyncDefault
) throws {
  let file: Foundation.FileHandle = try FileHandle(forWritingTo: url)
  try floats2bytes2file(floats: floats, file: file)
  try fsync(file)
}
