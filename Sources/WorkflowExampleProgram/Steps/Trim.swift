/// The "trim" step.

import Foundation
import Workflow
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
func trim_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async {
    
    // get the data:
    guard let data = await readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file) else { return }
    
    // start the processing of the data:
    await trim_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
}

/**
 The actual step.
 */
func trim_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) async {
    await execution.effectuate(executionDatabase, #function) {
        
        await execution.log(stepData.trimming, data.value)
        data.value = data.value.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = Trim_stepData.instance
struct Trim_stepData: StepData {
    
    static let instance = Trim_stepData()
    var stepDescription = "Trim the text."
    
    // Add non-static members of type XMessage here for all messages.
    // Only non-static members will be collected for the overview!
    
    public let trimming = Message(
        id: "trimming",
        type: .Info,
        fact: [
            .en: "strimming \"$1\"",
        ]
    )
}
