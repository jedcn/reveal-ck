module RevealCK
  module Changers
    #
    # Public: A Slicer knows how to remove a section of a file.
    #
    class Slicer
      def self.remove!(slice_file, range)
        lines = File.open(slice_file).readlines
        slicer = Slicer.new lines
        sliced_lines = slicer.remove range
        File.open(slice_file, 'w') { |file| file << sliced_lines.join }
      end

      def initialize(lines)
        @lines = lines
      end

      def remove(range)
        @lines.select.with_index { |line, index| !range.cover?(index) }
      end
    end
  end
end
