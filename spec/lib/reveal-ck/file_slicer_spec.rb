require 'spec_helper'
require 'fileutils'
require 'tmpdir'

describe FileSlicer do

  describe '.slice!' do

    let :before_slicer do
      File.join spec_dir, 'data', 'slicer', 'before_slicer'
    end

    let :after_slicer do
      File.join spec_dir, 'data', 'slicer', 'after_slicer'
    end

    it 'can cut a range of lines out of a file' do
      Dir.mktmpdir do |tmp_dir|
        FileUtils.cp before_slicer, tmp_dir
        test_file = File.join tmp_dir, 'before_slicer'
        FileSlicer.slice! test_file, 3..6
        test_file_contents = File.open(test_file).read
        after_slicer_contents = File.open(after_slicer).read
        test_file_contents.should == after_slicer_contents
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
