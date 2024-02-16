import ProjectDescription


// MARK: - Proejct+Extension
extension Project {
    
    public static func create(name: String, packages: [Package], settings: Settings, target: [Target], schemes: [Scheme]) -> Project {
        
        return Project(
            name: name,
            organizationName: "Junios Adventure",
            packages: packages,
            settings: settings,
            schemes: schemes
        )
        
    }

}

// MARK: - Target+Extension
extension Target {
    
    static private var defaultBundleId = "com.junios"
    
    private static func create(name: String, product: Product, infoPlist: InfoPlist, isNeedResource: Bool, dependencies: [TargetDependency]) -> Target {
        
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
    
    /// Feature
    public static func createFeature(feature: Feature, infoPlist: InfoPlist, dependencies: [TargetDependency]) -> Target {
        
        var baseDependencies: [TargetDependency] = [ .coreProject ]
        
        dependencies.forEach { baseDependencies.append($0) }
        
        return create(name: feature.rawValue, product: .staticFramework
                      , infoPlist: infoPlist, isNeedResource: true, dependencies: baseDependencies)
    }
    
    /// Domain
    public static func createDomain(domain: Domain, infoPlist: InfoPlist, dependencies: [TargetDependency]) -> Target {
        
        var baseDependencies: [TargetDependency] = [ .coreProject ]
        
        dependencies.forEach { baseDependencies.append($0) }
        
        return create(name: domain.rawValue, product: .staticFramework
                      , infoPlist: infoPlist, isNeedResource: true, dependencies: baseDependencies)
    }
    
    /// Service
    public static func createService(service: Service, infoPlist: InfoPlist, dependencies: [TargetDependency]) -> Target {
        
        var baseDependencies: [TargetDependency] = [ .coreProject ]
        
        dependencies.forEach { baseDependencies.append($0) }
        
        return create(name: service.rawValue, product: .staticFramework
                      , infoPlist: infoPlist, isNeedResource: true, dependencies: baseDependencies)
    }
    
}

extension TargetDependency {
    
    static let coreProject: TargetDependency = .project(target: "CoreProject", path: .relativeToRoot("\(workSpaceName)/Modules/CoreProject"))
}

// MARK: - Constants
public let workSpaceName = "JuniosWorkspace"


// MARK: - 영역별 타입정의
public enum ModuleTerritory: String {
    case presentation
    case domain
    case data
    
    var directoryName: String {
        switch self {
        case .presentation:
            "Presentation"
        case .domain:
            "Domain"
        case .data:
            "Data"
        }
    }
}

public enum Feature: String, ModuleNaming {
    case feature1 = "Feature1"
    
    var moduleTerritory: ModuleTerritory { .presentation }
}

public enum Domain: String, ModuleNaming {
    case domain1 = "domain1"
    
    var moduleTerritory: ModuleTerritory { .domain }
}

public enum Service: String, ModuleNaming {
    case service1 = "service1"
    
    var moduleTerritory: ModuleTerritory { .data }
}

/// 각각의 영역들의 모듈은 하나의 워크스페이스(JuniosWorkspace)에 속하게되는 프로젝트들이다.

protocol ModuleNaming: RawRepresentable<String> {
    
    var name: String { get }
    var rootPath: String { get }
    var moduleTerritory: ModuleTerritory { get }
}

extension ModuleNaming {
    
    public var name: String { "\(self.rawValue)\(type(of: self))" }
    var path: String { "Modules/\(moduleTerritory.directoryName)/\(name)" }
    public var rootPath: String { "\(workSpaceName)/\(path)" }
}
