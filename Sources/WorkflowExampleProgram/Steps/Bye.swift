/// The "bye" step.

import Foundation
import Workflow
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
func bye_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async {
    
    // get the data:
    guard let data = await readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file) else { return }
    
    // start the processing of the data:
    await bye_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
}

/**
 The actual step.
 */
func bye_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) async {
    await execution.effectuate(executionDatabase, #function) {
        
        await execution.log(stepData.sayingBye, data.value)
        
        await trim_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
        print("Bye \(data.value)!")
        
    }
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = Bye_stepData.instance
struct Bye_stepData: StepData {
    
    static let instance = Bye_stepData()
    var stepDescription = "Say hello."
    
    // Add non-static members of type XMessage here for all messages.
    // Only non-static members will be collected for the overview!
    
    public let sayingBye = Message(id: "saying bye", type: .Info, localizingMessage: [
        .en: "saying bye to $1"
    ])
}
