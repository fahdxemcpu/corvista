import CoreLocation
import Foundation
import Photos

/// `media.saveToPhotos` — copies a clip into the user's photo library.
/// Uses add-only access (NSPhotoLibraryAddUsageDescription): Corvista never reads the library.
enum PhotosSaver {
  /// Returns `saved`, `denied` (add-only access refused/restricted) or `failed`.
  static func save(video url: URL, createdAt: Date?, location: CLLocation?) async -> String {
    let status = await PHPhotoLibrary.requestAuthorization(for: .addOnly)
    guard status == .authorized || status == .limited else { return "denied" }
    do {
      try await PHPhotoLibrary.shared().performChanges {
        let request = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)
        if let createdAt { request?.creationDate = createdAt }
        if let location { request?.location = location }
      }
      return "saved"
    } catch {
      NSLog("[Corvista] saveToPhotos failed: \(error)")
      return "failed"
    }
  }
}
