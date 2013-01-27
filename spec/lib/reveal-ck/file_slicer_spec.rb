require 'spec_helper'
require 'fileutils'
require 'tmpdir'

describe FileSlicer do

  describe '.remove!' do

    let :before_remove do
      File.join spec_dir, 'data', 'slicer', 'before_remove'
    end

    let :after_remove do
      File.join spec_dir, 'data', 'slicer', 'after_remove'
    end

    it 'removes a range of lines from a file' do
      Dir.mktmpdir do |tmp_dir|
        FileUtils.cp before_remove, tmp_dir
        test_file = File.join tmp_dir, 'before_remove'
        FileSlicer.remove! test_file, 3..6
        test_file_contents = File.open(test_file).read
        after_remove_contents = File.open(after_remove).read
        test_file_contents.should == after_remove_contents
      end
    end
  end

  describe '#remove' do

    it 'returns lines with the range removed' do
      lines = [
               'a',
               'b',
               'c',
               'd'
              ]
      slicer = FileSlicer.new lines
      slicer.remove(1..2).should == ['a', 'd']
    end
  end
end
