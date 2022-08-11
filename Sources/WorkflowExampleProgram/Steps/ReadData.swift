/// The "readData" step.

import Foundation
import Workflow
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
func readData_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async {
    
    _ = await readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file)
}

/**
 The actual step.
 */
func readData_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async -> MyData? {
    var data: MyData? = nil
    await execution.effectuate(executionDatabase, #function) {
        
        await execution.log(stepData.readingDataInfo, file.path)
        
        guard let name = try? String(contentsOf: file, encoding: .utf8) else {
            await execution.log(stepData.readingDataInfo, file.path)
            return
        }
        
        data = MyData(name)
        
    }
    return data
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = ReadData_stepData.instance
struct ReadData_stepData: StepData {
    
    static let instance = ReadData_stepData()
    var stepDescription = "Read the data."
    
    // Add non-static members of type XMessage here for all messages.
    // Only non-static members will be collected for the overview!
    
    public let readingDataInfo = Message(
        id: "reading data",
        type: .Info,
        fact: [
            .en: "reading data from $1",
        ]
    )
    
    public let couldNotReadData = Message(
        id: "could not read data",
        type: .Fatal,
        fact: [
            .en: "could not read data from $1",
        ]
    )
}
