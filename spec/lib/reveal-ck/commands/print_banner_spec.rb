require 'spec_helper'

module RevealCK
  module Commands
    describe PrintBanner do
      describe '#run' do
        it 'sends #messages and #separators to the ui' do

          serve_ui = double

          expect(serve_ui)
            .to(receive(:separator))
            .at_least :once

          expect(serve_ui)
            .to(receive(:message))
            .at_least :once

          banner = PrintBanner.new('doc_root', 'port', 'slides_file', serve_ui)
          banner.run
        end
      end
    end
  end
end
