ActiveRecord::Schema.define do
  create_table :androids, :force => true do |t|
    t.string :name,      :limit => 10 
    t.text :description, :limit => 40
    t.integer :number,   :limit => 2
  end

  create_table :saiyajins, :force => true do |t|
    t.string :name,        :limit => 10 
    t.boolean :super
    t.integer :age,        :limit => 3
  end
end
