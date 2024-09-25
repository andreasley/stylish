public struct RenderConfiguration {
    public let newline: String
    public let singleSpace: String
    public let minify: Bool
    public let indent: Int
    
    public init(minify: Bool = false, indent: Int = 4) {
        self.minify = minify
        self.indent = minify ? 0 : indent
        self.newline = minify ? "" : "\n"
        self.singleSpace = minify ? "" : " "
    }
}
