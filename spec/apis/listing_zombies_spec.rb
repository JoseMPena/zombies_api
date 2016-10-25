# -*- encoding : utf-8 -*-
require 'spec_helper'


describe "Zombies API", :type => :api do

  it 'return list of all zombies' do
    FactoryGirl.create_list(:zombie, 10)
    get '/zombies'
    # Validate the response status code is 200
    expect(response).to be_success

    #Validates the response is not empty
    refute_empty response.body

    #Validates the response is a list of 10 zombies
    json = JSON.parse(response.body)
    expect(json['zombies'].length).to eq(10)
  end

  # it 'return zombies filtered by weapon' do
  #   john = Zombie.create!(name: 'John', weapon: 'axe')
  #   joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')
  #
  #   get '/zombies?weapon=axe'
  #   assert response.success?
  #
  #   zombies = JSON.parse(response.body, symbolize_names: true)
  #   names = zombies.collect { |z| z[:name]  }
  #
  #   refute_includes names, 'Joanna'
  #   assert_includes names, 'John'
  # end
end
