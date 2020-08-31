class AddAttributesToBreeds < ActiveRecord::Migration[6.0]
  def change
    add_column :breeds, :breed_category, :string
    add_column :breeds, :subbreed, :string
  end
end
