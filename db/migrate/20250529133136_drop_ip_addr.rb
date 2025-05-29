class ChangeIpAddr < ActiveRecord::Migration[5.0]
  def change
    remove_column :post_versions, :updater_ip_addr, :inet
    remove_column :pool_versions, :updater_ip_addr, :inet
  end
end
