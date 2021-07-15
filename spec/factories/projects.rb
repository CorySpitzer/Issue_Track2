require_relative '../rails_helper'

FactoryBot.define do 
    factory :project do 
        title {"Project1"}
        summary {"The 1st project"}
        description {"Create a good project using Rails"}
        status {"complete"}
    end
end