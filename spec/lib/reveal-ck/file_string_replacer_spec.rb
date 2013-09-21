require 'spec_helper'
require 'fileutils'
require 'tmpdir'

module RevealCK

  describe FileStringReplacer do

    describe '.replace!' do

      let :before_replace do
        File.join spec_dir, 'data', 'string_replacer', 'before_replace'
      end

      let :after_replace do
        File.join spec_dir, 'data', 'string_replacer', 'after_replace'
      end

      it 'replaces content within a file' do
        Dir.mktmpdir do |tmp_dir|
          FileUtils.cp before_replace, tmp_dir
          test_file = File.join tmp_dir, 'before_replace'
          FileStringReplacer.replace!(test_file,
                                      old: ' hideaway at sea',
                                      new: 'hh coconuts!')
          test_file_contents = File.open(test_file).read
          after_replace_contents = File.open(after_replace).read
          test_file_contents.should == after_replace_contents
        end
      end

    end
  end
end
