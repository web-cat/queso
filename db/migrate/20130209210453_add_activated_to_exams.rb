class AddActivatedToExams < ActiveRecord::Migration
  def change
    add_column :exams, :activated, :boolean, { :default => false }
  end
end
