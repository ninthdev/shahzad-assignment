class AddScoreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :score, :integer, default: 25
  end
end
