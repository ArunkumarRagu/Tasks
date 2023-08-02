class AddColRevert < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :status, :string

    revert do
      reversible do |reversible_migration|
        reversible_migration.up do
          # Add any data manipulation or additional changes needed when migrating up
          Product.update_all(status: 'active')
        end

        reversible_migration.down do
          # Add any data manipulation or additional changes needed when migrating down
          Product.update_all(status: nil)
        end
      end
    end
  end
end
