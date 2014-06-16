class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.string :comment
      t.timestamps
    end

    # 加入欄位，在events的資料表上加上category_id 欄位，型態是數字
    add_column :events, :category_id, :integer
    # 加入外鍵索引
    add_index :events, :category_id
  end
end
