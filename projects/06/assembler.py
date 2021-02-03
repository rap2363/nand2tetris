import argparse

# Map of jump instructions to their binary representations
jump_map = {
	'JGT': '001',
	'JEQ': '010',
	'JGE': '011',
	'JLT': '100',
	'JNE': '101',
	'JLE': '110',
	'JMP': '111'
}

dest_map = {
	'M'  : '001',
	'D'  : '010',
	'MD' : '011',
	'A'  : '100',
	'AM' : '101',
	'AD' : '110',
	'AMD': '111'
}

comp_map = {
	'0'  : '0101010',
	'1'  : '0111111',
	'-1' : '0111010',
	'D'  : '0001100',
	'A'  : '0110000',
	'M'  : '1110000',
	'!D' : '0001101',
	'!A' : '0110001',
	'!M' : '1110001',
	'-D' : '0001111',
	'-A' : '0110011',
	'-M' : '1110011',
	'D+1': '0011111',
	'A+1': '0110111', 
	'M+1': '1110111', 
	'D-1': '0001110',
	'A-1': '0110010', 
	'M-1': '1110010', 
	'D+A': '0000010',
	'D+M': '1000010',
	'D-A': '0010011', 
	'D-M': '1010011', 
	'A-D': '0000111', 
	'M-D': '1000111', 
	'D&A': '0000000',
	'D&M': '1000000',
	'D|A': '0010101', 
	'D|M': '1010101',
}

class SymbolTable:
	'''
	The symbol table is prepopulated with 23 pre-defined symbols according to the 
	Hack Machine Language Specification:
	Symbol | Value
	--------------
	R0     |     0
	R1     |     1
	R2     |     2
	R3     |     3
	R4     |     4
	R5     |     5
	R6     |     6
	R7     |     7
	R8     |     8
	R9     |     9
	R10    |    10
	R11    |    11
	R12    |    12
	R13    |    13
	R14    |    14
	R15    |    15
	SCREEN | 16384
	KBD    | 24576
	SP     | 	 0
	LCL    |     1
	ARG    |     2
	THIS   |     3
	THAT   |     4

	1. First we populate the symbol table with LABEL values i.e. (***) values in assembly.
	2. Second we populate the symbol table with variable declarations.
	'''
	def __init__(self):
		self.next_variable_loc = 16
		self.symbols = {
			'R0': 0,
			'R1' : 1,
			'R2' : 2,
			'R3' : 3,
			'R4' : 4,
			'R5' : 5,
			'R6' : 6,
			'R7' : 7,
			'R8' : 8,
			'R9' : 9,
			'R10' : 10,
			'R11' : 11,
			'R12' : 12,
			'R13' : 13,
			'R14' : 14,
			'R15' : 15,
			'SCREEN' : 16384,
			'KBD' : 24576,
			'SP' : 0,
			'LCL' : 1,
			'ARG' : 2,
			'THIS' : 3,
			'THAT' : 4
		}

	def get_value(self, symbol):
		if symbol in self.symbols:
			return self.symbols[symbol]
		# Otherwise add it as a new variable and return the value.
		self.symbols[symbol] = self.next_variable_loc
		self.next_variable_loc += 1
		return self.symbols[symbol]

	def add_label(self, label, addr):
		if label in self.symbols:
			raise Exception("Label {} has already been added to symbol table!".format(label))
		self.symbols[label] = addr

	def add_variable(self, variable):
		if variable in self.symbols:
			raise Exception("Variable {} has already been added to symbol table!".format(variable))
		self.symbols[variable] = self.next_variable_loc
		self.next_variable_loc += 1

def to_a_instruction(address):
	'''
	Assembly: @address
	Hack: 0[address as a 15-bit unsigned integer]
	'''
	return '0' + to_unsigned_repr(int(address))

def to_c_instruction(a_val, c_vals, d_vals, j_vals):
	'''
	Assembly: dest=comp;jump
	Hack: 111a c1c2c3c4 c5c6d1d2 d3j1j2j3
	'''
	return '111' + a_val + c_vals + d_vals + j_vals

def to_unsigned_repr(addr):
	if addr < 0 or addr > 32767:
		raise Exception("Invalid address provided: {}".format(addr))
	repr_str = ''
	for val in [2**x for x in range(14, -1, -1)]:
		# If we can subtract the value, we do so and mark it.
		if addr >= val:
			addr -= val
			repr_str += '1'
		else:
			repr_str += '0'
	return repr_str

def run(filename):
	symbol_table = SymbolTable()
	lines = []
	with open(filename) as fp:
		lines = fp.read().splitlines()
	instructions = []
	line_num = 0
	for line in lines:
		# First pass, define symbols and remove whitespace.
		line = line.replace(' ', '').split('//')[0]
		if len(line) == 0:
			# Skip empty lines
			continue
		# If this is a label, add it to the table with a reference to the line number. Otherwise continue.
		if line[0] == '(' and line[-1] == ')':
			symbol_table.add_label(line[1:-1], line_num)
		else:
			instructions.append(line)
			line_num += 1

	# Now process each instruction, using the symbol table to add new variables or convert symbols where necessary.
	hack_lines = []
	for instruction in instructions:
		if instruction[0] == '@':
			# This is an A-instruction
			val = instruction[1:]
			if val.isdigit():
				hack_lines.append(to_a_instruction(val))
			else:
				hack_lines.append(to_a_instruction(symbol_table.get_value(val)))
		else:
			# This is a C-instruction
			c_ins = instruction.split(';')
			j_bits = '000'
			if len(c_ins) == 2:
				j_bits = jump_map[c_ins[1]]

			# Now look at the left half of the instruction
			dest_comp = c_ins[0].split('=')

			d_bits = '000'
			if len(dest_comp) == 2:
				# This means we have an assignment, so the d_bits are assigned appropriately
				d_bits = dest_map[dest_comp[0]]

			# Finally we look at the comp part of the instruction to assign the a and c_bits
			comp_bits = '000'
			comp_bits = comp_map[dest_comp[-1]]

			hack_lines.append(to_c_instruction(comp_bits[0], comp_bits[1:], d_bits, j_bits))

	return hack_lines

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument("filename", help="Path to input *.asm file to convert to *.hack")
	args = parser.parse_args()
	if args.filename[-4:] != '.asm':
		raise IOError("Invalid file: {0}, must provide an .asm file for conversion.".format(args.filename))
	hack_lines = run(args.filename)
	with open(args.filename[0:-4] + '.hack', "w") as fp:
		for hack_line in hack_lines:
			fp.write(hack_line + '\n')
