class RemoveNameFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :name, :string
  end
end
