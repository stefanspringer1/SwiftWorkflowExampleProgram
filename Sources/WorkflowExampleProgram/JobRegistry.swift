// The job registry:

import Foundation
import Workflow

typealias Job = (
    Execution,
    ExecutionDatabase,
    URL
) async -> ()


/// For constructing a job registry.
public struct JobAndData {
    var job: Job?
    var stepData: StepData?
}

@available(macOS 10.15.0, *)
var jobRegistry: [String:JobAndData] = [
    "bye": JobAndData(job: bye_job, stepData: Bye_stepData.instance),
    "hello": JobAndData(job: hello_job, stepData: nil), // the hello implementation is external
    "hello-and-bye": JobAndData(job: helloAndBye_job, stepData: HelloAndBye_stepData.instance),
]
