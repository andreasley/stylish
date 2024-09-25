public protocol Renderable {
    func render(configuration: RenderConfiguration, level: Int, parentSelector: String?) -> String
}
