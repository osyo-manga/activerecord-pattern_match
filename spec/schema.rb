ActiveRecord::Schema.define do
  create_table :users, force: true do |t|
    t.string  :name
    t.integer :age

    t.timestamps
  end
end

class User < ActiveRecord::Base
end
