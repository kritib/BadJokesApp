class CreateJokes < ActiveRecord::Migration
  def change
    create_table :jokes do |t|
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
