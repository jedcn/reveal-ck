class FileSlicer

  def self.slice!(path, range)
    slice_file = if File.exists? path
      path
    else
      File.expand_path(File.join(Dir.pwd, path))
    end
    lines = File.open(slice_file).readlines
    slicer = FileSlicer.new lines
    sliced_lines = slicer.remove range
    File.open(slice_file, 'w') { |f| f << sliced_lines.join }
  end

  def initialize(lines)
    @lines = lines
  end

  def remove(range)
    @lines.select.with_index { |line, index| ! range.cover? index }
  end

end
