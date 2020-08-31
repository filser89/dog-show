class RemoveNameFromBreeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :breeds, :name, :string
  end
end
