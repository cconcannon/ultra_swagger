class AddBrandModelSexPerformanceAnnoyancesTypeToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :review
    add_column :items, :brand, :string
    add_column :items, :model, :string
    add_column :items, :sex, :string
    add_column :items, :performance, :integer
    add_column :items, :annoyances, :integer
  end
end
