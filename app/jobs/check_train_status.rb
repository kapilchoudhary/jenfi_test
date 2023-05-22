class CheckTrainStatus < ApplicationJob
  def perform
    Train.left.where("left_at < ? ", Time.now - 3.hours).each do |train|
      train.update(status: "arrived")
      train.parcels.update_all(status: "shipped")
      train.withdrawn!
      Line.find(train.assigned_line).available!
    end
  end
end