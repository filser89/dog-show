class AddNullFalseToDogsAttributes < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:dogs, :name, false)
  end
end
