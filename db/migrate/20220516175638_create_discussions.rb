class CreateDiscussions < ActiveRecord::Migration[6.1]
  def change
    create_table :discussions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.boolean :pinned, default: false
      t.boolean :closed, default: false
      
      t.timestamps
    end
  end
end
