require 'machinist/active_record'
require 'faker'
require 'sham'

Sham.body { Faker::Lorem.sentences(3).join('.') }
Sham.file_name { Faker::Lorem.words(2).join('.') }
Sham.title { Faker::Lorem.words(3).join('.') }

Page.blueprint do
  title { Sham.title }
  body { Sham.body }
end

Setting.blueprint do
  key { Sham.title }
  value { Sham.body }
end

Upload.blueprint do
  attachment_file_name { Sham.file_name }
end