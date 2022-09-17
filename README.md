# SwiftWorkflowExampleProgram

An example for defining steps according to the [Workflow](https://github.com/stefanspringer1/SwiftWorkflow.git) framework, using steps defined in [another library](https://github.com/stefanspringer1/SwiftWorkflowExampleLibrary).

It reads a name from a file and does something with it accordings to the job name.

The job name can be given via `-j <job name>` with `<job name>` being replaces by either:

- `hello`
- `bye`
- `hello-and-bye`

Note that one the steps defined (`bye_step`) is an example for an asynchronous step.
