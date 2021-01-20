class AddCommunicationAndMonitoringToLeadershipTable < ActiveRecord::Migration[6.0]
  def change
    add_column :leaderships, :communication, :integer
    add_column :leaderships, :monitoring_and_evaluating, :integer
  end
end
