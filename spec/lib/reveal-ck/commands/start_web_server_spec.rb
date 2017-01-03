require 'spec_helper'
require 'tmpdir'

module RevealCK
  module Commands
    describe StartWebServer do
      describe '#run' do
        it 'works with Rack to start an application' do
          start_web_server =
            StartWebServer.new('doc_root', 'port', 'host')
          rack_server = double
          expect(::Rack::Server)
            .to(receive(:new))
            .and_return(rack_server)
          expect(rack_server)
            .to(receive(:start))
          start_web_server.run
        end
      end
    end
  end
end
