import Foundation
import ArgumentParser
import Workflow
import WorkflowExampleData

@main
@available(macOS 10.15, *)
struct Main: AsyncParsableCommand {

    @Argument(help: "The path to the file containing the name.")
    var path: String
    
    @Option(name: [.customShort("j"), .long], help: "The name of the job.")
    var job: String
    
    mutating func run() async throws {
        
        if let jobFunction = jobRegistry[job]?.job {
            
            let applicationName = "SwiftWorkflowExampleProgram"
            let logger = PrintLogger()
            let execution = Execution(logger: logger, applicationName: applicationName, showSteps: true)
            
            await jobFunction(
                execution,
                ExecutionDatabase(),
                URL(fileURLWithPath: path)
            )
        }
        else {
            print("Error: Job not found!")
        }
    }
}
