// CoreProject

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CoreProject",
    targets: [
        Target(
            name: "CoreTarget",
            platform: .iOS,
            product: .staticFramework,
            bundleId: "com.junios.core",
            sources: [
                "Sources/**"
            ],
            resources: [
                "Resources/**"
            ]
        )
    ]
)
