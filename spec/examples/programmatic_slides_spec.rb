require 'spec_helper'

describe 'examples/programmatic_slides.rb' do

  it 'prints output from a presentation with several slides' do
    expect($stdout).to receive :puts
    expect {
      load 'examples/programmatic_slides.rb'
    }.to_not raise_error
  end

end
