require "rails_helper"

RSpec.feature "Delete car", :type => :feature do
    scenario "User delete a car offer" do
        car = create(:car)
        visit cars_path

        click_on("Удалить")
    end
end