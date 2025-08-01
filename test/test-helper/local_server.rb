# frozen_string_literal: true
require 'webrick'

module LocalServer
  def self.start(port = 8081)
    server = WEBrick::HTTPServer.new(
      Port: port,
      AccessLog: [],
      Logger: WEBrick::Log.new(File::NULL)
    )

    server.mount_proc '/get' do |_, res|
      res.status = 200
      res['Content-Type'] = 'text/plain'
      res.body = 'Get response body.'
    end

    trap('INT') { server.shutdown }

    Thread.new { server.start }
    sleep 1 # wait for server to be ready
  end
end