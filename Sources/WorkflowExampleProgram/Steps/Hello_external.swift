/// The "hello" step.
/// This is a wrapper around the "hello" step in the library "SwiftWorkflowExampleLibrary".

import Foundation
import Workflow
import WorkflowExampleLibrary
import WorkflowExampleData

/**
 Wrapper if directly called for a file.
 */
@available(macOS 10.15.0, *)
func hello_job(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    file: URL
) async {
    
    // get the data:
    guard let data = await readData_step(during: execution, usingExecutionDatabase: executionDatabase, file: file) else { return }
    
    // start the processing of the data:
    await hello_external_step(during: execution, usingExecutionDatabase: executionDatabase, data: data)
}

/**
 The actual step.
 */
@available(macOS 10.15.0, *)
func hello_external_step(
    during execution: Execution,
    usingExecutionDatabase executionDatabase: ExecutionDatabase,
    data: MyData
) async {
    await execution.effectuate(executionDatabase, #function) {
        
        await hello_lib(during: execution, data: data)
        
    }
}
