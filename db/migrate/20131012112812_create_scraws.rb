class CreateScraws < ActiveRecord::Migration
  def change
    create_table :scraws do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :poster

      t.timestamps
    end
  end
end
