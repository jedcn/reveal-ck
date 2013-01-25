require 'spec_helper'

class Redactor

  def initialize(text)
    @text = text
  end

  def redact(range)
    regex = Regexp.new "#{range.first}.*?#{range.last}"
    @text.gsub regex, ''
  end

end

describe Redactor do

  context '#new' do
    it 'is constructed with a String' do
      expect do
        Redactor.new 'hi!'
      end.to_not raise_error
    end
  end

  context 'with text' do

    let :sample do
      'hi, how are you?'
    end

    it 'can remove specified text' do
      r = Redactor.new sample
      r.redact('how'..'you').should == 'hi, ?'
    end

    it 'leaves the original text alone if there are no matches' do
      r = Redactor.new sample
      r.redact('blue'..'shoe').should == sample
    end
  end

  context 'with html' do

    let :html_sample do
      '<body><section>hi</section><p>bye</p><section>bye</section></body>'
    end

    it 'can remove multiple occurrences of an element' do
      r = Redactor.new html_sample
      r.redact('<section>'..'</section>').should == '<body><p>bye</p></body>'
    end

  end
end
