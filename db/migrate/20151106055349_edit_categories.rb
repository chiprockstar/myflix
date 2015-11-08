class EditCategories < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.remove :video_id
    end

    change_table :videos do |t|
      t.belongs_to :category, index: true
    end
  end
end
