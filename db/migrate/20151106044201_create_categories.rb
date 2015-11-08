class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :video, index: true
      t.string :category
      t.timestamps null: false
    end
    add_column :videos, :created_at, :datetime
    add_column :videos, :updated_at, :datetime
  end
end
