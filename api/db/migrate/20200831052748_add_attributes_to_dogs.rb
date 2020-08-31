class AddAttributesToDogs < ActiveRecord::Migration[6.0]
  def change
    add_column :dogs, :age, :integer
    add_column :dogs, :gender, :string
  end
end
