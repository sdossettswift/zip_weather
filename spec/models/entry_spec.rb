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
      xit 'correctly determines N direction '
    end
      xit 'correctly determines S direction '
    end
      xit 'correctly determines E direction '
    end
      xit 'correctly determines W direction '
    end 
  end

end
