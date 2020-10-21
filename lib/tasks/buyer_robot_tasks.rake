desc 'Buy random amount of cars'
task buyer_robot_make_shopping: :environment do
  rand(1...10).times do |index|
    model = Model.order("RANDOM()").first
    BuyerRobot.call(model_name: model.name)
  end
end
