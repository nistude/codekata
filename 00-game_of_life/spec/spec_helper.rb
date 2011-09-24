require 'game_of_life'

def capture_stdout
  old_stdout = $stdout
  buffer = StringIO.new
  $stdout = buffer

  yield

  $stdout = old_stdout

  buffer.string
end
