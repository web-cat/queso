class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :statement
      t.integer :points

      t.timestamps
    end
  end
end
