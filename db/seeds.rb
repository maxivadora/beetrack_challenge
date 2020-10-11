Vehicle.create!(identifier: 'AA-001')
Vehicle.create!(identifier: 'AA-002')

AA01 = [
  [46.5820313, 51.1242128, '2020-10-01 10:10:10'],
  [64.9072266, 46.0122238, '2020-10-02 10:10:10'],
  [79.2773438, 54.6992335, '2020-10-03 10:10:10'],
  [92.9003906, 43.9295499, '2020-10-04 10:10:10'],
  [119.1357422, 50.1205781, '2020-10-05 10:10:10']
].freeze

AA02 = [
  [-71.1914063, -51.3992057, '2020-09-01 10:10:10'],
  [-71.1035156, -48.6619428, '2020-09-05 10:10:10'],
  [-68.5107422, -45.6754822, '2020-09-06 10:10:10'],
  [-71.5429688, -41.9349765, '2020-09-07 10:10:10'],
  [-70.3564453, -35.8534396, '2020-09-08 10:10:10'],
  [-70.1367188, -30.2211019, '2020-09-09 10:10:10']
].freeze

AA01.each do |position|
  Position.create(
    latitude: position[1],
    longitude: position[0],
    sent_at: position[2],
    vehicle_identifier: 'AA-001'
  )
end

AA02.each do |position|
  Position.create(
    latitude: position[1],
    longitude: position[0],
    sent_at: position[2],
    vehicle_identifier: 'AA-002'
  )
end