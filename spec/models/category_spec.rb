require 'spec_helper'

describe Category do
  it { should have_many(:videos) }
  describe "#recent_videos" do

    it "should return most recent six videos" do
      comedies = Category.create(category: "comedies")
      6.times { Video.create(title: "Stripes", description: "Army", category: comedies)}
      south_park = Video.create(title: "South Park", description: "Funny", category: comedies, created_at: 1.day.ago)
      expect(comedies.recent_videos).not_to include(south_park)

    end

    it "should return less than six videos" do
      comedies = Category.create(category: "comedies")
      futurama = Video.create(title: "Futurama", description: "Outer Space", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "Funny", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)
    end

    it "should return no more than six videos" do
      comedies = Category.create(category: "comedies")
      7.times { Video.create(title: "Stripes", description: "Army", category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
    end

    it "should return videos in descending order by created_at" do
      comedies = Category.create(category: "comedies")
      futurama = Video.create(title: "Futurama", description: "Outer Space", category: comedies, created_at: 1.day.ago)
      south_park = Video.create(title: "South Park", description: "Funny", category: comedies)
      expect(comedies.recent_videos).to eq([south_park, futurama])
    end

    it "returns empty array if there are no videos in the category" do
      comedies = Category.create(category: "Sitcom")
      expect(comedies.recent_videos).to eq([])
    end
  end
end
