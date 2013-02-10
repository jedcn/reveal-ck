module RevealCK
  jeweler_version_file = File.expand_path(File.join(__FILE__, '..', '..', '..', 'VERSION'))
  VERSION = File.open(jeweler_version_file).read
end
