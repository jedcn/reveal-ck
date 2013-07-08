module RevealCK
  class FileStringReplacer

    def self.replace!(path, args)
      old, new = args[:old], args[:new]
      file = if File.exists? path
               path
             else
               File.expand_path(File.join(Dir.pwd, path))
             end
      lines = File.open(file).read
      lines = lines.sub old, new
      File.open(file, 'w') { |f| f << lines }
    end

  end
end
