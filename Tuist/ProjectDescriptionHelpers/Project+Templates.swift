import ProjectDescription

extension Project {
    
    public func create(name: String, packages: [Package], settings: Settings, target: [Target], schemes: [Scheme]) -> Project {
        
        return Project(
            name: name,
            organizationName: "Junios Adventure",
            packages: packages,
            settings: settings,
            schemes: schemes
        )
        
    }

}

extension Target {
    
    static private var defaultBundleId = "com.junios"
    
    private func create(name: String, product: Product, infoPlist: InfoPlist, isNeedResource: Bool, dependencies: [TargetDependency]) -> Target {
        
        let resources: ResourceFileElements = ["Resources/**"]
        
        return Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: "\(Self.defaultBundleId).\(name)",
            infoPlist: infoPlist,
            sources: [
                "Sources/**"
            ],
            resources: isNeedResource ? resources : [],
            dependencies: dependencies
        )
    }
}
