require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe "Scopes" do
    let!(:entries) do
      [Entry.create(:zip => '77019', :city => 'Houston'),
       Entry.create(:zip => '77005', :city => 'Houston'),
       Entry.create(:zip => '77002', :city => 'Houston'),
       Entry.create(:zip => '77007', :city => 'Houston'),
       Entry.create(:zip => '77098'),
       Entry.create(:zip => '76710'),
       Entry.create(:zip => '76710'),

      ]
    end

    it "named scope 'five_latest' limits results to five" do
      expect(Entry.five_latest.length).to match(5)
    end

    it "named scope 'has_city' limits results to four" do
      expect(Entry.has_city.length).to match(4)
    end

    it "named scope 'has_city'.'five_latest' limits results to five" do
      expect(Entry.has_city.five_latest.length).to match(4)
    end

    it "without named scope, displays all" do
      expect(Entry.all.length).to match(7)
    end
  end

  describe 'Validations' do
    it "does not permit invalid characters in zipcodes" do
     @e= Entry.create(:zip=>"THISISNOTAZIP")
     expect(@e.errors.count).to eq(2)

    end

    it "does not permit zipcodes that are too long" do
       @e = Entry.create(:zip=>"88888888")
       expect(@e.errors.count).to eq(1)
    end

    it "does not permit zipcodes that are too short" do
      @e = Entry.create(:zip=>"33")
      expect(@e.errors.count).to eq(2)
    end

    it "does allow properly formed zipcodes" do
      @e = Entry.create(:zip=>"77005")
      expect(@e.errors.count).to eq(0)
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
