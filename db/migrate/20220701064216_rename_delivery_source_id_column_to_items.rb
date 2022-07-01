class RenameDeliverySourceIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :delivery_source_id, :prefecture_id
  end
end
