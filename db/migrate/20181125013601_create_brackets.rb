class CreateBrackets < ActiveRecord::Migration[5.1]
  def change
    create_table :brackets do |t|
      t.string :title

      t.timestamps
    end
  end
end
