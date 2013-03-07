class AddDeadlinesToExams < ActiveRecord::Migration
  def change
    add_column :exams, :available_at, :datetime
    add_column :exams, :closes_at, :datetime
  end
end
