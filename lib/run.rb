require 'mqtt'

STDOUT.sync = true

mqtt_server = 'broker.lan'

puts "Starting MQTT connection to '#{mqtt_server}'…"

MQTT::Client.connect(mqtt_server) do |c|
  puts ' OK.'
  c.get('haum/gachaum/tag/uid') do |topic, message|
    puts "#{topic}: #{message}"
    card = Card.find_by(uid: message)
    begin
      puts "Welcome, #{card.user.name}."
      log = Log.create user_id: card.user.id, card_id: card.id
      log.save
      c.publish('haum/gachaum/strike', 'open')
    rescue StandardError
      Log.create unknown_card: message
      puts 'Unknown card, aborting'
    end
  end
end
