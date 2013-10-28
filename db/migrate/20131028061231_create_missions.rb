class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :user_id
      t.string  :name,   :null => false, :default => ''
      t.string  :status, :null => false, :default => 'planned'

      t.timestamps
    end # create table
  end # method change
end # migration
