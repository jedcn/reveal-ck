require 'spec_helper'
require 'fileutils'
require 'tmpdir'

describe FileSplicer do

  describe '.insert!' do

    let :before_insert do
      File.join spec_dir, 'data', 'splicer', 'before_insert'
    end

    let :abcd do
      File.join spec_dir, 'data', 'splicer', 'abcd'
    end

    let :after_insert do
      File.join spec_dir, 'data', 'splicer', 'after_insert'
    end

    it 'inserts one file into another' do
      Dir.mktmpdir do |tmp_dir|
        FileUtils.cp before_insert, tmp_dir
        test_file = File.join tmp_dir, 'before_insert'
        FileSplicer.insert! abcd, into: test_file, after: '3'
        test_file_contents = File.open(test_file).read
        after_insert_contents = File.open(after_insert).read
        test_file_contents.should == after_insert_contents
      end
    end
  end

  describe '#insert' do
    it 'inserts lines after a match' do
      original = ['0', '1', '2', '3']
      splicer = FileSplicer.new original
      result = splicer.insert ['a', 'b', 'c'], after: '2'
      result.should == ['0', '1', '2', 'a', 'b', 'c', '3']
    end
  end
end
