/// The "hello" step.
/// This is a wrapper around the "hello" step in the library "SwiftWorkflowExampleLibrary".

import Foundation
import Workflow
import WorkflowExampleLibrary
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
func hello_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) {
    
    // get the data:
    guard let data = readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file) else { return }
    
    // start the processing of the data:
    hello_external_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
}

/**
 The actual step.
 */
func hello_external_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) {
    execution.effectuate(executionDatabase, #function) {
        
        hello_lib(during: execution, data: data)
        
    }
}
