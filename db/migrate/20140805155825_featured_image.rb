class FeaturedImage < ActiveRecord::Migration
  def change
    rename_column :projects, :titelbild, :featured_image
  end
end
