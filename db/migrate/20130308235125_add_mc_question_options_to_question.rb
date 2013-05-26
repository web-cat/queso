class AddMcQuestionOptionsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :options, :text
    add_column :questions, :allow_multiple, :boolean
  end
end
