require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "search_by_title" do
    it 'should return empty array when search term has no match' do
      futurama = Video.create(title: "Futurama", description: "Outer Space")
      south_park = Video.create(title: "South Park", description: "Funny")
      search = Video.search_by_title("Lost")
      expect(search).to eq([])
    end

    it 'should return a one item array when search term exactly matches' do
      futurama = Video.create(title: "Futurama", description: "Outer Space")
      south_park = Video.create(title: "South Park", description: "Funny")
      search = Video.search_by_title("Futurama")
      expect(search).to eq([futurama])
    end

    it 'should return a one item array for a partial match' do
      futurama = Video.create(title: "Futurama", description: "Outer Space")
      south_park = Video.create(title: "South Park", description: "Funny")
      search = Video.search_by_title("rama")
      expect(search).to eq([futurama])
    end

    it 'should return an array of all matches ordered by created_at' do
      futurama = Video.create(title: "Futurama", description: "Outer Space")
      south_park = Video.create(title: "South Park", description: "Funny")
      search = Video.search_by_title("a")
      expect(search).to eq([south_park, futurama])
    end

    it 'should return an empty array for an empty string to match' do
      futurama = Video.create(title: "Futurama", description: "Outer Space")
      south_park = Video.create(title: "South Park", description: "Funny")
      search = Video.search_by_title("")
      expect(search).to eq([])
    end
  end
end
