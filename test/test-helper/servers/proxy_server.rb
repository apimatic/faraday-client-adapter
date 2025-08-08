# frozen_string_literal: true
require 'socket'
require 'timeout'

module LocalServer
  class ProxyServer
    attr_reader :port, :pid

    def initialize(port: 8882, auth: nil)
      @port = port
      @auth = auth
      @pid = nil
    end

    def start
      cmd = ["mitmdump", "--listen-port", port.to_s]
      cmd += ["--proxyauth", @auth] if @auth

      @pid = Process.spawn(*cmd)
      wait_until_ready
    end

    def stop
      Process.kill("TERM", @pid) if @pid
      Process.wait(@pid) rescue nil
    rescue Errno::ESRCH
      warn "Process #{@pid} does not exist"
    rescue Errno::EINVAL
      warn "Process #{@pid} is invalid — likely already exited"
    end

    private

    def wait_until_ready(timeout = 10)
      Timeout.timeout(timeout) do
        loop do
          begin
            TCPSocket.new("localhost", port).close
            break
          rescue Errno::ECONNREFUSED
            sleep 0.2
          end
        end
      end
    rescue Timeout::Error
      raise "mitmproxy did not start on port #{port} within #{timeout} seconds"
    end
  end
end
