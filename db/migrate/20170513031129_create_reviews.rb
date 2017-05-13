class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :tutor
      t.string :semester
      t.date :year
      t.text :title
      t.string :credit
      t.string :mandatory
      t.string :online
      t.text :review
      t.string :reading1
      t.string :reading2
      t.string :reading3
      t.string :reading4
      t.integer :rating

      t.timestamps
    end
  end
end
