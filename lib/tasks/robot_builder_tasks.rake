desc 'Robot builder make 10 random cars'
task robot_builder_make_new_cars: :environment do
  10.times do
    model = Model.order("RANDOM()").first
    RobotBuilder.create_model_car(model: model)
  end
end

desc 'Robot builder makes basic construction and moves cars to electric'
task robot_builder_set_up_basic_cars: :environment do
  RobotBuilder.set_up_basic
end

desc 'Robot builder makes electric construction and moves cars to final'
task robot_builder_set_up_electronic_cars: :environment do
  RobotBuilder.set_up_electronic
end

desc 'Robot builder makes final manipulation and moves cars to warehouse'
task robot_builder_set_up_final_cars: :environment do
  RobotBuilder.set_up_final
end