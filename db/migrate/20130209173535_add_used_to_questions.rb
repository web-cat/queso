class AddUsedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :used, :boolean, { :default => false }
  end
end
