module CryptiKit
  class ServerInstaller
    def initialize(task)
      @task = task
    end

    def install(node, deps)
      insp = ServerInspector.new(@task)
      insp.detect

      begin
        installer = Kernel.const_get("CryptiKit::#{insp.os}Installer").new(@task)
        installer.install(node, deps)
      rescue NameError
        raise 'Unimplemented installation method.'
      end
    end
  end
end
