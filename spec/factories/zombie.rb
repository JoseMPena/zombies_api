FactoryGirl.define do
  # This will mock the Zombie class
  factory :zombie, class: OpenStruct do
    name "John"
    weapon "axe"
  end

end
