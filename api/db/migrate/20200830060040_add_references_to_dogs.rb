class AddReferencesToDogs < ActiveRecord::Migration[6.0]
  def change
    add_reference :dogs, :breed, foreign_key: true, null: false
  end
end
