require_relative '../lib/library.rb'
describe Library do

  it 'checks there is a collection of books' do
    expect(:book).not_to be_empty
  end
end
