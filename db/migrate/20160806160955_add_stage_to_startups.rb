class AddStageToStartups < ActiveRecord::Migration[5.0]
  def change
    add_column :startups, :stage, :integer
  end
end
