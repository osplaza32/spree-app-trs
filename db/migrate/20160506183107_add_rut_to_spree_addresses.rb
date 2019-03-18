class AddRutToSpreeAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :rut, :string
  end
end
