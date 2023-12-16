import ProjectDescription

let project = Project(
    name: "Appetizers",
    organizationName: "YourCompany",
    packages: [],
    targets: [
        Target(
            name: "Appetizers",
            platform: .iOS,
            product: .app,
            bundleId: "com.yourcompany.Appetizers",
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": "", // Correct the dictionary closure here
            ]), // Moved the closing bracket to the correct position
            sources: [
                "Appetizers/Screens/**/*.swift",
                "Appetizers/Views/**/*.swift",
                "Appetizers/Model/**/*.swift",
                "Appetizers/Utilities/**/*.swift",
                "Appetizers/**/*.swift",
            ],
            resources: [
                "Appetizers/Assets.xcassets",
                "Appetizers/Preview Content/**",
            ],
            dependencies: []
        ),
    ],
    schemes: [],
    additionalFiles: []
)
