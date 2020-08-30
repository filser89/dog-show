class AddNullFalseToBreedsName < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:breeds, :name, false)
  end
end
