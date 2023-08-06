class AddIsFadedToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :is_faded, :boolean
  end
end
