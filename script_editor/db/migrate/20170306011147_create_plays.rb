class CreatePlays < ActiveRecord::Migration[5.0]
  def change
    create_table :plays do |t|
      t.string :title

      t.timestamps
    end
  end
end
