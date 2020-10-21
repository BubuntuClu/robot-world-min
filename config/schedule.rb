every 1.minutes do
  rake "robot_builder_make_new_cars"
end

every 2.minutes do
  rake "robot_builder_set_up_basic_cars"
end

every 2.minutes do
  rake "robot_builder_set_up_electronic_cars"
end

every 2.minutes do
  rake "robot_builder_set_up_final_cars"
end

every 4.minutes do
  rake 'robot_guard_search_defect'
end

every 30.minutes do
  rake 'robot_guard_move_cars'
end

every '0 0 * * *' do
  rake 'robot_destroy_not_sold_cars'
end
