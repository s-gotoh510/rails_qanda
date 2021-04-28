class AddFinishedToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :finished, :boolean
  end
end
