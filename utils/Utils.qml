pragma Singleton

import Quickshell
import Quickshell.Io
import qs.config

Singleton {
  Process {
    id: processExecutor
  }

  function launchApplication(application) {
    let command = [];
    if (Settings.launchPrefix) {
      const prefix = Settings.launchPrefix.split(" ");
      command = command.concat(prefix);
    }
    if (application.runInTerminal) {
      const terminal = Quickshell.env("TERMINAL");
      command = command.concat([terminal, "-e"]);
    }
    const exec = application.execString.split(" ");
    command = command.concat(exec);
    processExecutor.command = command;
    processExecutor.startDetached();
  }
}
