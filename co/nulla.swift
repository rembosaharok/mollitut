func alphaThresholdFilter(inputImage: UIImage, threshold: CGFloat) -> UIImage? {
    guard let ciImage = CIImage(image: inputImage) else { return nil }
    
    let filter = CIFilter(name: "CIMaskToAlpha")
    filter?.setValue(ciImage, forKey: kCIInputImageKey)
    
    let alphaThreshold = threshold.clamped(to: 0.0...1.0)
    let alphaMask = CIImage(color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: alphaThreshold))
    
    filter?.setValue(alphaMask, forKey: "inputMask")
    
    if let outputImage = filter?.outputImage {
        let context = CIContext(options: nil)
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImage)
        }
    }
    
    return nil
}
