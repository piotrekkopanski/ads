class ChangeCategoryToBeIntegerInNotifications < ActiveRecord::Migration[5.1]
  def change
  	change_column :notifications, :category, :integer
  end
end
