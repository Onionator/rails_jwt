class CreateTableReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :text_body
      t.belongs_to :destination, foreign_key: true
    end
  end
end
