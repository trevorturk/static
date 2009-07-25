require 'machinist/active_record'
require 'faker'
require 'sham'

Sham.title { Faker::Lorem.words(3).join('.') }
Sham.body { Faker::Lorem.sentences(3).join('.') }

Page.blueprint do
  title { Sham.title }
  body { Sham.body }
end
