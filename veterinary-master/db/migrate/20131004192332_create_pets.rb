class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.integer :weight
      t.datetime :last_visit
      t.integer :user_id
      t.integer :doctor_id

      t.timestamps
    end
    add_index :pets, :name
    add_index :pets, :user_id
    add_index :pets, :doctor_id
  end
end
