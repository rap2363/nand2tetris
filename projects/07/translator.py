import argparse

# Nice little decorator to use static vars for a function.
def static_vars(**kwargs):
    def decorate(func):
        for k in kwargs:
            setattr(func, k, kwargs[k])
        return func
    return decorate

def flatten(items):
	flattened_list = []
	for item in items:
		flattened_list.extend(item)
	return flattened_list

def assign_constant(constant):
	return [
		'@{0} // D={0}'.format(constant),
		'D=A'
	]

def increment_stack_ptr():
	return [
		'@SP // SP++',
		'M=M+1'
	]

def decrement_stack_ptr():
	return [
		'@SP // SP--',
		'M=M-1'
	]

def assign_stack_ptr_from_data():
	return [
		'@SP // *SP=D',
		'A=M',
		'M=D'
	]

def assign_data_from_stack_ptr():
	return [
		'@SP // D=*SP',
		'A=M',
		'D=M'
	]

def assign_data_from_index(index):
	return [
		'@{} // D=*index'.format(index),
		'D=M'
	]

def assign_index_from_data(index):
	return [
		'@{} // *index=D'.format(index),
		'M=D'
	]

def assign_stack_ptr_from_segment(segment, index):
	return [
		'@{1} // *SP=*({0}+{1})'.format(segment, index),
		'D=A',
		'@{}'.format(segment),
		'A=M',
		'A=D+A',
		'D=M',
		'@SP',
		'A=M',
		'M=D'
	]

def assign_segment_from_stack_ptr(segment, index):
	return [
		'@{1} // *({0}+{1})=*SP'.format(segment, index),
		'D=A',
		'@{}'.format(segment),
		'A=M',
		'A=D+A',
		'D=A',
		'@offsetaddr // offsetaddr={0}+{1}'.format(segment, index),
		'M=D',
		'@SP',
		'A=M',
		'D=M',
		'@offsetaddr',
		'A=M',
		'M=D'
	]

def assign_var_from_stack_ptr(var_name):
	return [
		'@SP // {}=*SP'.format(var_name),
		'A=M',
		'D=M',
		'@{}'.format(var_name),
		'M=D'
	]

def assign_stack_ptr_var(var_name):
	return [
		'@{0} // *SP={0}'.format(var_name),
		'D=M',
		'@SP'.format(var_name),
		'A=M',
		'M=D'
	]

@static_vars(unique_instruction_id=0)
def binary_operation(x, y, op):
	'''Stores the result of a binary operation x(op)y in D. For the boolean ops, false is 0 and true is -1'''
	instr_id = binary_operation.unique_instruction_id
	binary_operation.unique_instruction_id += 1
	if op in ('+', '-', '&', '|'):
		return [
			'@{0} // {0}{1}{2}'.format(x, op, y),
			'D=M',
			'@result',
			'M=D',
			'@{}'.format(y),
			'D=M',
			'@result',
			'D=M{}D'.format(op)
		]
	elif op == '==':
		return [
			'@{0} // {0}{1}{2}'.format(x, op, y),
			'D=M',
			'@{}'.format(y),
			'D=D-M',
			'@EQUAL_RESULT_{}'.format(instr_id),
			'D;JEQ // Jump to the equality branch',
			'D=0',
			'@DONE_{}'.format(instr_id),
			'0;JMP // Results are not equal, jump to the end',
			'(EQUAL_RESULT_{})'.format(instr_id),
			'D=-1',
			'(DONE_{})'.format(instr_id)
		]
		return []
	elif op == '<':
		return [
			'@{0} // {0}{1}{2}'.format(x, op, y),
			'D=M',
			'@{}'.format(y),
			'D=D-M',
			'@LT_RESULT_{}'.format(instr_id),
			'D;JLT // Jump to the less-than branch',
			'D=0',
			'@DONE_{}'.format(instr_id),
			'0;JMP // {0}>={1}, jump to the end'.format(x, y),
			'(LT_RESULT_{})'.format(instr_id),
			'D=-1',
			'(DONE_{})'.format(instr_id)
		]
	elif op == '>':
		return [
			'@{0} // {0}{1}{2}'.format(x, op, y),
			'D=M',
			'@{}'.format(y),
			'D=D-M',
			'@GT_RESULT_{}'.format(instr_id),
			'D;JGT // Jump to the greater-than branch',
			'D=0',
			'@DONE_{}'.format(instr_id),
			'0;JMP // {0}<={1}, jump to the end'.format(x, y),
			'(GT_RESULT_{})'.format(instr_id),
			'D=-1',
			'(DONE_{})'.format(instr_id)
		]

def unary_operation(var, op):
	'''Stores the result of a unary operation in D'''
	return [
		'@{0} // {1}{0}'.format(var, op),
		'D={}M'.format(op),
	]

def stack_unary_operation(op):
	'''Stores the result of a unary operation on the SP'''
	return [
		'@SP // *SP={}(*SP)'.format(op),
		'A=M',
		'M={}M'.format(op)
	]

def to_binary_command(operation):
	'''Stack Operation: x(operation)y
	   Rough Translation: SP--, x=*SP, SP--, y=*SP, r=x(operation)y, *SP=r, SP++'''
	return flatten([
		decrement_stack_ptr(),
		assign_var_from_stack_ptr('y'),
		decrement_stack_ptr(),
		assign_var_from_stack_ptr('x'),
		binary_operation('x', 'y', operation),
		assign_stack_ptr_from_data(),
		increment_stack_ptr()
	])

def to_unary_command(operation):
	'''Stack Operation: (operation)y
	   Rough Translation: SP--, *SP=(operation)*SP, SP++'''
	return flatten([
		decrement_stack_ptr(),
		stack_unary_operation(operation),
		increment_stack_ptr()
	])
	# return flatten([
	# 	decrement_stack_ptr(),
	# 	assign_var_from_stack_ptr('y'),
	# 	unary_operation('y', operation),
	# 	assign_stack_ptr_from_data(),
	# 	increment_stack_ptr()
	# ])

def to_command(line):
	return {
		'add': to_binary_command('+'),
		'sub': to_binary_command('-'),
		'neg': to_unary_command('-'),
		'eq': to_binary_command('=='),
		'gt': to_binary_command('>'),
		'lt': to_binary_command('<'),
		'and': to_binary_command('&'),
		'or': to_binary_command('|'),
		'not': to_unary_command('!')
	}[line]

def to_push_constant(constant):
	return flatten([
		assign_constant(constant),
		assign_stack_ptr_from_data(),
		increment_stack_ptr()
	])

def push_from_index(index):
	'''Stack Operation: Push a value from the index onto the stack
	   Rough Translation: *SP=*index, SP++'''
	return flatten([
	 	assign_data_from_index(index),
	 	assign_stack_ptr_from_data(),
	 	increment_stack_ptr()
	 ])

def pop_from_index(index):
	'''Stack Operation: Pop a value from the stack to index
	   Rough Translation: SP--, *index=*SP'''
	return flatten([
	 	decrement_stack_ptr(),
	 	assign_data_from_stack_ptr(),
	 	assign_index_from_data(index)
	 ])

def push_segment(segment, index):
	'''Stack Operation: Push a value from a specified memory segment/index onto the stack
	   Rough Translation: *SP=*(segment+index), SP++
	'''
	return flatten([
		assign_stack_ptr_from_segment(segment, index),
		increment_stack_ptr()
	])

def pop_segment(segment, index):
	'''Stack Operation: Pop a value from the stack and store it on a specified memory segment/index
	   Rough Translation: SP--, *(segment+index)=*SP
	'''
	return flatten([
		decrement_stack_ptr(),
		assign_segment_from_stack_ptr(segment, index)
	])

def push_static(variable_name):
	'''Stack Operation: Push a value from static variable onto the stack
	   Rough Translation: *SP=filename.index, SP++
	'''
	return flatten([
		assign_stack_ptr_var(variable_name),
		increment_stack_ptr()
	])


def pop_static(variable_name):
	'''Stack Operation: Pop a value from the stack and store it to the static variable
	   Rough Translation: SP--, filename.index=*SP
	'''
	return flatten([
		decrement_stack_ptr(),
		assign_var_from_stack_ptr(variable_name)
	])

def to_memory_access(filename, line):
	return {
		('push', 'local'): push_segment('LCL', line[2]),
		('pop', 'local'): pop_segment('LCL', line[2]),

		('push', 'argument'): push_segment('ARG', line[2]),
		('pop', 'argument'): pop_segment('ARG', line[2]),

		('push', 'this'): push_segment('THIS', line[2]),
		('pop', 'this'): pop_segment('THIS', line[2]),

		('push', 'that'): push_segment('THAT', line[2]),
		('pop', 'that'): pop_segment('THAT', line[2]),

		('push', 'constant'): to_push_constant(line[2]),

		# Temp segment is fixed to tR5
		('push', 'temp'): push_from_index(5 + int(line[2])),
		('pop', 'temp'): pop_from_index(5 + int(line[2])),

		# Pointer segment is fixed to R3
		('push', 'pointer'): push_from_index(3 + int(line[2])),
		('pop', 'pointer'): pop_from_index(3 + int(line[2])),

		('push', 'static'): push_static('{0}.{1}'.format(filename, line[2])),
		('pop', 'static'): pop_static('{0}.{1}'.format(filename, line[2])),
	}[(line[0], line[1])]

def done_instruction():
	return [
		'(PROGRAM_COMPLETE)',
		'@PROGRAM_COMPLETE',
		'0;JMP'
	]

def translate_instruction(filename, instruction):
	if len(instruction) == 1:
		return to_command(instruction[0])
	else:
		return to_memory_access(filename, instruction)
	return [' '.join(instruction)]

def translate(filename):
	lines = []
	with open(filename) as fp:
		lines = fp.read().splitlines()
	file = filename.split('/')[-1]
	instructions = []
	line_num = 0
	for line in lines:
		# Remove comments
		line = line.split('//')[0]
		if len(line) == 0:
			# Skip empty lines
			continue
		instruction = line.split(' ')
		assert len(instruction) == 1 or len(instruction) == 3 # Either a command or memory segment op
		instructions.append(instruction)
	translated_instructions = []
	for instruction in instructions:
		translated_instructions.extend(translate_instruction(file, instruction))
	# Always append a final DONE instruction to avoid incrementing the PC further into uncharted territory.
	translated_instructions.extend(done_instruction())
	return translated_instructions

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument("filename", help="Path to input *.vm file to translate to *.asm")
	args = parser.parse_args()
	if args.filename[-3:] != '.vm':
		raise IOError("Invalid file: {0}, must provide an *.vm file for conversion.".format(args.filename))
	asm_lines = translate(args.filename)
	with open(args.filename[0:-3] + '.asm', "w") as fp:
		for hack_line in asm_lines:
			fp.write(hack_line + '\n')
	for asm_line in asm_lines:
		print(asm_line)
