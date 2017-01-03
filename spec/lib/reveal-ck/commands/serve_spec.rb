require 'spec_helper'
require 'tmpdir'

def build_serve
  RevealCK::Commands::Serve
    .new(doc_root: 'doc_root',
         port: 'port',
         host: 'host',
         user_dir: 'user_dir',
         gem_dir: 'gem_dir',
         output_dir: 'output_dir',
         slides_file: 'slides_file')
end

def expect_new_and_run(klazz)
  mock = double
  expect(klazz)
    .to(receive(:new))
    .and_return(mock)
  expect(mock).to(receive(:run))
end

def allow_new_and_run(klazz)
  mock = double
  allow(klazz)
    .to(receive(:new))
    .and_return(mock)
  allow(mock).to(receive(:run))
end

module RevealCK
  module Commands
    describe Serve do
      describe '#rebuild_slides' do
        it 'relies on Generate' do
          serve = build_serve
          expect_new_and_run(RevealCK::Commands::Generate)
          serve.rebuild_slides
        end

        it 'reports errors via the ui' do
          serve_ui = double
          expect(ServeUI)
            .to(receive(:new))
            .and_return(serve_ui)

          expect(serve_ui)
            .to(receive(:prefix_for))

          expect(serve_ui)
            .to(receive(:problem))

          generate_command = double
          expect(Generate)
            .to(receive(:new))
            .and_return(generate_command)
          expect(generate_command)
            .to(receive(:run))
            .and_raise('Big Trouble!')

          build_serve.rebuild_slides
        end
      end

      describe '#run' do
        it 'coordinates a number of objects to serve up slides and reload' do
          serve_ui = double
          expect(ServeUI)
            .to(receive(:new))
            .and_return(serve_ui)

          allow(serve_ui)
            .to(receive(:message))

          print_banner = double
          expect(PrintBanner)
            .to(receive(:new))
            .with('doc_root', 'port', 'host', 'slides_file', serve_ui)
            .and_return(print_banner)
          expect(print_banner)
            .to(receive(:run))

          expect_new_and_run(RevealCK::Commands::ListenToRebuildSlides)
          expect_new_and_run(RevealCK::Commands::ListenToReloadBrowser)
          expect_new_and_run(RevealCK::Commands::StartWebServer)
          build_serve.run
        end
      end
    end
  end
end
