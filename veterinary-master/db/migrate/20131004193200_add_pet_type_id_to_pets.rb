class AddPetTypeIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :pet_type_id, :integer
    add_index :pets, :pet_type_id
  end
end
