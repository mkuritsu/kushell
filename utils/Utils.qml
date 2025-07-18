pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
  Process {
    id: processExecutor
  }

  function launchApplication(application) {
    if (application.runInTerminal) {
      const terminal = Quickshell.env("TERMINAL")
      processExecutor.command = [terminal, "-e", application.execString]
      processExecutor.startDetached()
      return
    }
    application.execute()
  }
}
