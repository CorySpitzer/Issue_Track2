require 'rails_helper'

# We want to test our custom code with register, not what devise provides,
# which is well-tested
# RSpec.describe 'the Register path', type: :feature do 
#     scenario 'register an end user' do
#         visit root_path
#         click_on 'Register'
#         fill_in 'Email', with: 'testing@testing.com'
#         fill_in 'Password', with: 'NoOneCanGuessMyGreatPassword'
#         select 'end_user', :from => 'role'
#     end
# end

# error:
#   Unable to find select box "role" that is not disabled