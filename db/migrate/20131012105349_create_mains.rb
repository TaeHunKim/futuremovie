class CreateMains < ActiveRecord::Migration
  def change
    create_table :mains do |t|
      t.time :last

      t.timestamps
    end
  end
end
