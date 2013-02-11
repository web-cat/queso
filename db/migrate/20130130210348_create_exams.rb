class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.integer :attempts_allowed

      t.timestamps
    end
  end
end
