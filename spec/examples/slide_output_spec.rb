require 'spec_helper'

describe 'examples/slide_output.rb' do

  it 'prints output from a single slide' do
    expect($stdout).to receive :puts
    expect do
      load 'examples/slide_output.rb'
    end.to_not raise_error
  end

end
