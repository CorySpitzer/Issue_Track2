require 'rails_helper'

describe Project do
    it { should have_many(:issues)}
end