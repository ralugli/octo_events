class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :number, index: true, null: false
      t.string :action, limit: 100, null: false
      t.string :issue_url, limit: 300, null: false
      t.timestamps
    end
  end
end
