require 'spec_helper'

module RevealCK
  module Commands
    describe ServeUI do
      let :serve_ui do
        ServeUI.new
      end

      let :separator do
        '------------------------------------------------------------'
      end

      let :default_prefix do
        '[ reveal-ck ]'
      end

      let :problem_prefix do
        '[  problem  ]'
      end

      describe '#message' do
        it 'prints the message (preceeded by a prefix) to standard out' do
          expect(serve_ui).to receive(:puts).with("#{default_prefix} Hello")
          serve_ui.message('Hello')
        end
      end

      describe '#problem' do
        it 'prints several messages to standard out' do
          expect(serve_ui).to receive(:puts).with("#{problem_prefix}")
          expect(serve_ui)
            .to receive(:puts)
            .with("#{problem_prefix} Compilation Problem")
          expect(serve_ui).to receive(:puts).with("#{problem_prefix}")
          expect(serve_ui)
            .to receive(:puts)
            .with("#{problem_prefix} on line 12")
          expect(serve_ui).to receive(:puts).with("#{problem_prefix}")
          serve_ui.problem('Compilation Problem', 'on line 12')
        end
      end

      describe '#blank' do
        it 'prints a blank line' do
          expect(serve_ui).to receive(:puts).with ''
          serve_ui.blank
        end
      end

      describe '#separator' do
        it 'prints a bunch of dashes' do
          expect(serve_ui)
            .to receive(:puts).with separator
          serve_ui.separator
        end
      end
    end
  end
end
