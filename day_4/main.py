
import pprint 
pp = pprint.PrettyPrinter(width=41, compact=True)
p = pp.pprint 

class Board:
	def __init__(self, size: int = 5):
		self.size = size 
		self.winner = False
		self.board = [[[] for _ in range(self.size)] for _ in range(self.size)]

	def add(self, el: int, row: int, col: int):
		self.board[row][col] = (el, False)

	def check_win2(self):
		for i in range(self.size):
			row = 0
			for j in range(self.size):
				x = self.board[i][j][1]
				if x:
					row += 1
			if row == self.size:
				self.winner = True
				return True
		for c in range(self.size):
			col = 0
			for i in range(self.size):
				x = self.board[i][c][1]
				if x:
					col += 1
			if col == self.size:
				self.winner = True
				return True

			
	def get_score(self):
		scored = 0
		for i in range(self.size):
			for j in range(self.size):
				el = self.board[i][j]
				if not el[1]:
					scored += el[0]
		return scored

	def pick(self, val):
		for i, row in enumerate(self.board):
			for j, col in enumerate(row):
				el = self.board[i][j]
				if el[0] == val:
					self.board[i][j] = (val, True)
					return self.board[i][j]							

	def __repr__(self):
		c = []
		for row in self.board:
			c.append('-- '.join([f'{x[0]} {int(x[1])}' for x in row]))
		return '\n'.join(c)

def load():
	with open("input.txt") as f:
		input = f.read()
		input = input.split("\n\n")
		picks = []
		for el in input.pop(0).split(','):
			picks.append(int(el))
		boards = []
		for line in input:
			board = Board()
			for row, card  in enumerate(line.split("\n")):	
				for col, el in enumerate(card.split()):
					val = int(el)
					board.add(val, row, col)
			boards.append(board)
		return (boards, picks)

def main():
	boards, picks = load()
	# Solution 1
	solution_1(boards,picks)
	solution_2(boards, picks)

def solution_2(boards, picks):
	for pick in picks:
		for i, board in enumerate(boards):
			board.pick(pick)
			board.check_win2()
			w = [x.winner for x in boards]
			if all(w):
				score = board.get_score()
				print(f'Solution 2: {score * pick}')
				return


def solution_1(boards,picks):
	for pick in picks:
		for board in boards:
			board.pick(pick)
			if board.check_win2():
				score = board.get_score()
				p(f'Solution 1: {score * pick}')
				return

if __name__ == "__main__":
	main()
