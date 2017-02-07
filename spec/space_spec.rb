require './app/models/space'

describe Space do
  # subject(:space) { described_class.new }
  # let(:title) { double :title }
  let(:space) { Space.create(title: 'London Flat', description: 'Nice flat in the heart of London.', price: 89.90) }


  it "allows a space to have a title" do
    expect(space.title).to eq('London Flat')
  end

  it "allows a space to have a description" do
    expect(space.description).to eq('Nice flat in the heart of London.')
  end

  it "allows a space to have a price" do
    expect(space.price).to eq(89.90)
  end


end
