# frozen_string_literal: true

namespace :after_party do
  desc 'Deployment task: populate_initial_data'
  task populate_initial_data: :environment do
    puts "Running deploy task 'populate_initial_data'"

    random_command =
      if ActiveRecord::Base.connection.adapter_name == 'MySQL'
        Arel.sql('RAND()')
      else
        Arel.sql('RANDOM()')
      end

    ActiveRecord::Base.transaction do
      (1..100).each do |_index|
        City.create(
          name: Faker::Address.city,
          state: Faker::Address.state_abbr
        )
      end

      (1..100).each do |_index|
        Company.create(
          name: Faker::Company.name,
          city: City.order(random_command).first
        )
      end

      (1..10_000).each do |_index|
        Person.create(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          city: City.order(random_command).first,
          company: Company.order(random_command).first
        )
      end
    end

    # Update task as completed.  If you remove the line below, the task will
    # run with every deploy (or every time you call after_party:run).
    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
