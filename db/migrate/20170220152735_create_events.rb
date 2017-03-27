class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.date :start
      t.integer :view_count
      t.string :tags
      t.integer :user_id

      t.timestamps
    end
  end
end
