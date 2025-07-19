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
      const exec = application.execString.split(" ")[0];
      processExecutor.command = [terminal, "-e", exec]
      processExecutor.startDetached()
      return
    }
    application.execute()
  }
}
