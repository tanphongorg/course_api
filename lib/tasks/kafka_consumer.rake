namespace :kafka_consumer do
  task course_created: :environment do
    require "kafka"

    kafka = Kafka.new(seed_brokers: ["kafka:9092"])

    # Consumers with the same group id will form a Consumer Group together.
    consumer = kafka.consumer(group_id: "my-consumer")

    # It's possible to subscribe to multiple topics by calling `subscribe`
    # repeatedly.
    consumer.subscribe("course_created")

    # This will loop indefinitely, yielding each message in turn.
    consumer.each_message do |message|
      puts message.topic, message.partition
      puts message.offset, message.key, message.value
    end
  end
end
