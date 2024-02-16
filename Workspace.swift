import ProjectDescription

let workspace = Workspace(
    name: "JuniosWorkspace",
    projects: [
        .relativeToRoot("JuniosWorkspace/Modules/CoreProject")
    ]
)
