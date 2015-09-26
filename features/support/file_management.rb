# Absolute path of reveal-ck/features
def features_dir
  File.expand_path(File.join(File.dirname(__FILE__), '..'))
end

# Support for easily copying any file underneath features to a new
# location. Presumed to be helpful for copying around test data stored
# at reveal-ck/features/data.
def copy_file_under_features(rel_features_file, dest_file)
  abs_features_file = File.join features_dir, rel_features_file
  cd '.' do
    dest_dir = File.dirname dest_file
    FileUtils.mkdir_p(dest_dir) unless File.directory?(dest_dir)
    FileUtils.cp abs_features_file, dest_dir
  end
end
