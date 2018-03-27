require 'mqtt'

mqtt_server = 'broker.lan'

MQTT::Client.connect(mqtt_server) do |c|
  puts 'READY'
  c.get('haum/gachaum/tag/uid') do |topic, message|
    puts "#{topic}: #{message}"
    card = Card.find_by(number: message)
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
