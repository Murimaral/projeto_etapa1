class AddSlugToCarCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :car_categories, :slug, :string
    add_index :car_categories, :slug, unique: true
  end
end
