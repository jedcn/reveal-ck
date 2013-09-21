module RevealCK
  #
  # Public: A FileSlicer knows how to remove a section of a file.
  #
  class FileSlicer

    def self.remove!(slice_file, range)
      lines = File.open(slice_file).readlines
      slicer = FileSlicer.new lines
      sliced_lines = slicer.remove range
      File.open(slice_file, 'w') { |file| file << sliced_lines.join }
    end

    def initialize(lines)
      @lines = lines
    end

    def remove(range)
      @lines.select.with_index { |line, index| ! range.cover? index }
    end

  end
end
