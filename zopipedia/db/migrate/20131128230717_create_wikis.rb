class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.string :body
      t.boolean :public

      t.timestamps
    end
  end
end
