class AddEmployeeCountToStartup < ActiveRecord::Migration[5.0]
  def change
    add_column :startups, :employee_count, :string
  end
end
