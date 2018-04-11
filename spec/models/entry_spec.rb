require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "Scopes" do
    let!(:entries) do
      [Entry.create(:zip => '77019', :temp => 70.5),
       Entry.create(:zip => '77005', :temp => 72),
       Entry.create(:zip => '77002', :temp => 89),
       Entry.create(:zip => '77007', :temp => 61),
       Entry.create(:zip => '77098', :temp => 64),
       Entry.create(:zip => '76710', :temp => 87.1),
      ]
    end

    it "named scope 'five_latest' limits results to five" do
      expect(Entry.five_latest.length).to match(5)
    end

    it "without named scope, displays all" do
      expect(Entry.all.length).to match(6)
    end
  end

  describe 'Validations' do
    xit "does not permit invalid characters in zipcodes" do
    end

    xit "does not permit zipcodes that are too long" do
    end

    xit "does not permit zipcodes that are too short" do
    end

    xit "does allow properly formed zipcodes" do
    end
  end

  describe 'Attributes' do

    xit "accepts values for humidity" do
    end

    xit "accepts values for temperature" do
    end

    xit "accepts values for wind speed" do
    end

    xit "accepts values for wind direction" do
    end

    xit "accepts values for general description" do
    end

    xit "accepts values for pressure" do
    end

  end

    describe 'Conversion of Wind Degrees into Directions' do
      it 'correctly determines N direction ' do
        @entry = Entry.create(:wind_direction => "0")
        expect(@entry.wind_direction_in_words).to eq("N")
    end
      it 'correctly determines S direction ' do
        @entry = Entry.create(:wind_direction => "170.7")
        expect(@entry.wind_direction_in_words).to eq("S")
    end
      it 'correctly determines E direction ' do
        @entry = Entry.create(:wind_direction => "79")
        expect(@entry.wind_direction_in_words).to eq("E")
    end
      it 'correctly determines W direction ' do
        @entry = Entry.create(:wind_direction => "260.4")
        expect(@entry.wind_direction_in_words).to eq("W")
    end
    it 'correctly determines SW direction ' do
      @entry = Entry.create(:wind_direction => "230.4")
      expect(@entry.wind_direction_in_words).to eq("SW")
    end
    it 'correctly determines NW direction ' do
      @entry = Entry.create(:wind_direction => "304")
      expect(@entry.wind_direction_in_words).to eq("NW")
    end
    it 'correctly determines SE direction ' do
      @entry = Entry.create(:wind_direction => "125.75")
      expect(@entry.wind_direction_in_words).to eq("SE")
    end
    it 'correctly determines NE direction ' do
      @entry = Entry.create(:wind_direction => "56.2")
      expect(@entry.wind_direction_in_words).to eq("NE")
    end

  end

end
