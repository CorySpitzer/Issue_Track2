class Project < ApplicationRecord
    # https://stackoverflow.com/questions/29560805/rails-how-to-use-dependent-destroy-in-rails
    # :dependent => :delete_all is necessary to remove all the issues that a project has
    has_many :issues, :dependent => :destroy
    # has_many :issues, :dependent => :destroy, foreign_key: :project_id
    # has_many :issues, :dependent => :delete_all

    validates :summary, presence: true
    validates :description, presence: true
    validates :title, presence: true
end
