# frozen_string_literal: true

require 'benchmark'

module Rake
  class Task
    def execute_with_benchmark(*args)
      time = Benchmark.realtime { execute_without_benchmark(*args) }
      puts "   🏎️\t[#{name}] #{time.round(4)} seconds"
    end

    alias execute_without_benchmark execute
    alias execute execute_with_benchmark
  end
end
