/// The "hello" step.

import Foundation
import Workflow
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
func helloAndBye_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async {
    
    // get the data:
    guard let data = readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file) else { return }
    
    // start the processing of the data:
    await helloAndBye_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
}

/**
 The actual step.
 */
func helloAndBye_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) async {
    await execution.async.effectuate(executionDatabase, #function) {
        
        execution.log(stepData.sayingHelloAndBye, data.value)
        
        trim_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
        hello_external_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
        await bye_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
        
    }
}

/**
 The step data, including the error messages.
 */
fileprivate let stepData = HelloAndBye_stepData.instance
struct HelloAndBye_stepData: StepData {
    
    static let instance = HelloAndBye_stepData()
    var stepDescription = "Say hello and bye."
    
    // Add non-static members of type XMessage here for all messages.
    // Only non-static members will be collected for the overview!
    
    public let sayingHelloAndBye = Message(
        id: "saying hello and bye",
        type: .Info,
        fact: [
            .en: "saying hello and bye to $1",
        ]
    )
}
