module RevealCK
  #
  # Public: A FileSplicer knows how to insert a list of lines into a
  # file.
  #
  class FileSplicer

    def initialize(lines)
      @lines = lines
    end

    def insert(new_lines, opts)
      index = @lines.each.with_index do |line, i|
        break i + 1 if line.include? opts[:after]
      end
      @lines.insert(index, new_lines).flatten
    end

    def self.insert!(to_insert, opts)
      to_insert_lines = readlines to_insert
      insert_into_file = find_file opts[:into]
      insert_into_lines = readlines insert_into_file

      splicer = FileSplicer.new insert_into_lines
      spliced_lines = splicer.insert to_insert_lines, after: opts[:after]
      File.open(insert_into_file, 'w') { |f| f << spliced_lines.join }
    end

    private

    def self.find_file(path)
      if File.exists? path
        path
      else
        File.expand_original(File.join(Dir.pwd, to_insert))
      end
    end

    def self.readlines(path)
      file = find_file path
      File.open(file).readlines
    end

  end
end
