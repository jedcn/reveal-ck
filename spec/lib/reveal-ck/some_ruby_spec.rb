describe 'Array.zip' do
  it 'can join two arrays together like a zipper' do
    nums = [ 1, 2 ]
    chars = [ 'a', 'b' ]

    result = nums.zip chars
    result.should == [ [ 1, 'a' ], [ 2, 'b' ] ]
  end
end

describe 'String.*' do
  it 'repeats a string n times' do
    ('x' * 16).should == 'xxxxxxxxxxxxxxxx'
  end
end
