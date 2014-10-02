require 'spec_helper'

module RevealCK
  module Commands
    describe Serve do
      describe '#run' do
        it 'serves up the slides and reloads' do
          serve =
            Serve.new(doc_root: 'doc_root',
                      port: 'port',
                      user_dir: 'user_dir',
                      gem_dir: 'gem_dir',
                      output_dir: 'output_dir',
                      slides_file: 'slides_file')

          print_banner = double
          expect(PrintBanner)
            .to(receive(:new))
            .with('doc_root', 'port', 'slides_file')
            .and_return(print_banner)
          expect(print_banner)
            .to(receive(:run))

          listen_to_rebuild_slides = double
          expect(ListenToRebuildSlides)
            .to(receive(:new))
            .and_return(listen_to_rebuild_slides)
          expect(listen_to_rebuild_slides)
            .to(receive(:run))

          listen_to_reload_browser = double
          expect(ListenToReloadBrowser)
            .to(receive(:new))
            .and_return(listen_to_reload_browser)
          expect(listen_to_reload_browser)
            .to(receive(:run))

          start_web_server = double
          expect(StartWebServer)
            .to(receive(:new))
            .and_return(start_web_server)
          expect(start_web_server)
            .to(receive(:run))

          serve.run
        end
      end
    end
  end
end
