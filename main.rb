require_relative 'app'

class AppRunner
  def self.run
    app = App.new
    app.run
  end
end

AppRunner.run
