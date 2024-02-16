import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

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
