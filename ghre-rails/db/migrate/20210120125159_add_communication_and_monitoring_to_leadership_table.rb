class AddCommunicationAndMonitoringToLeadershipTable < ActiveRecord::Migration[6.0]
  def change
    change_table :leaderships, bulk: true do |t|
      t.column :communication, :integer
      t.column :monitoring_and_evaluating, :integer
    end
  end
end
