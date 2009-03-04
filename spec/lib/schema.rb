ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define(:version => 1) do
  create_table :people, :force => true do |t|
    t.string :description
  end
end