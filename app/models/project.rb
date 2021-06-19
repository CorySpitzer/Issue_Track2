class Project < ApplicationRecord
    has_many :issues#, :dependent => :destroy 
    #this is no longer needed because we do it manually.
    
    validates :summary, presence: true
    validates :description, presence: true
    validates :title, presence: true
end
