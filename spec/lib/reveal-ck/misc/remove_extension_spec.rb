require 'spec_helper'

module RevealCK
  module Misc
    describe RemoveExtension do
      describe 'remove_extension' do
        class Sample
          include RemoveExtension
        end

        let :sample do
          Sample.new
        end

        it 'removes a file extension' do
          result = sample.remove_extension('slides.md')
          expect(result).to eq 'slides'

          result = sample.remove_extension('google_talk.haml')
          expect(result).to eq 'google_talk'
        end
      end
    end
  end
end
