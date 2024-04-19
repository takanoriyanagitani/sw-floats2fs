import FloatsToFileSystem
import Foundation

let dat: [Float32] = [
  42.0,
  634.0,
  333.0,
]

let pwd: String = Foundation.FileManager.default.currentDirectoryPath
let filename: String = pwd + "/floats.dat"
let url: Foundation.URL = URL(fileURLWithPath: "./floats.dat")

let empty: Foundation.Data = Data()

do {
  try empty.write(to: url)
  try FloatsToFileSystem.floats2bytes2url(
    floats: dat,
    url: url,
    fsync: FloatsToFileSystem.fsyncDefault
  )
} catch {
  print("err: \( error )")
}
