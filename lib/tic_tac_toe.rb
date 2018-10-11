WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5 ,8],
  [0, 4, 8],
  [2, 4, 6]
]

def position_taken?(board, index)
  return board[index] != ' '
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  return input.to_i - 1
end

def valid_move?(board, position)
  if position < 0 || position > 8
    return false
  elsif position_taken?(board, position)
    return false
  end

  return true
end

def move(board, position, player = "X")
  if !position_taken?(board, position)
    board[position] = player
  end
end

def turn(board)
  input = gets
  input = input_to_index(input)

  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0

  board.each do |e|
    if e != ' '
      counter += e
    end
  end

  return counter
end