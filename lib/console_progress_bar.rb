require "console_progress_bar/version"
require "console_progress_bar/print_tools"
require "console_progress_bar/extras"
require "console_progress_bar/counter"
require "console_progress_bar/animator"
require "console_progress_bar/bar"

module ConsoleProgressBar

  class ProgressBar

    def self.counter(options = {})
      new.counter(options)
    end

    def self.animator(options = {})
      new.animator(options)
    end

    def self.bar(options = {})
      new.bar(options)
    end

  	def counter(options = {})
  		init_options(options)
  		ConsoleProgressBar::Counter.new(@total, @with_elapsed_time, @with_remaining_time, @increment_size)
  	end

  	def animator(options = {})
  		init_options(options)
  		ConsoleProgressBar::Animator.new(@total, @with_elapsed_time, @with_remaining_time, @increment_size)
  	end

  	def bar(options = {})
  		init_options(options)
  		ConsoleProgressBar::Bar.new(@total, @with_elapsed_time, @with_remaining_time, @increment_size, @width)
  	end

  private
  	def init_options(options = {})
  		unless options.nil?
  			@total = options[:total].nil? ? 100 : options[:total]
  			@with_elapsed_time = options[:with_elapsed_time].nil? ? false : options[:with_elapsed_time]
  			@with_remaining_time = options[:with_remaining_time].nil? ? false : options[:with_remaining_time]
  			@increment_size = options[:increment_size].nil? ? 1 : options[:increment_size]
  			@width = options[:width].nil? ? 20 : options[:width]
  		end
  	end

  end

end
