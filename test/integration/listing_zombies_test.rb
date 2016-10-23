# -*- encoding : utf-8 -*-
require 'test_helper'

class ListingZombiesTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'return list of all zombies' do
    get '/zombies'
    assert_equal(200, response.status)
    #same as 'assert response.success?' helper method

    refute_empty response.body
  end

  test 'return zombies filtered by weapon' do
    john = Zombie.create!(name: 'John', weapon: 'axe')
    joanna = Zombie.create!(name: 'Joanna', weapon: 'shotgun')

    get '/zombies?weapon=axe'
    assert response.success?

    zombies = JSON.parse(response.body, symbolize_names: true)
    names = zombies.collect { |z| z[:name]  }

    refute_includes names, 'Joanna'
    assert_includes names, 'John'
  end
end
