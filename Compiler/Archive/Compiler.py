import requests as rs
import pandas as pd
import numpy as np

# Getting the opcodes and its binary values
csv_url = "https://docs.google.com/spreadsheets/d/1JsX5NXx-bVLXxPskk3GZAyl4a2Tsh_Kx7lxHQxBCEOE/export?format=csv&id=1JsX5NXx-bVLXxPskk3GZAyl4a2Tsh_Kx7lxHQxBCEOE&gid=0"
res=rs.get(url=csv_url)
open('ISA_OPCODE.csv', 'wb').write(res.content)
df = pd.read_csv('ISA_OPCODE.csv', usecols = ['Bin','Instruction'])
op = df.set_index('Instruction').T.to_dict('list')
count = 0
jump_check = 0

opcodes = {key.split(" ")[0]: int(str(value[0]).replace(" ", ""),2) for key, value in op.items()}
# print("Opcodes:\n")
# print(opcodes)

regs = {'AR':1, 'DR':2, 'PC':3, 'IR':4, 'R1':5, 'R2':6, 'R3':7, 'R4':8, 'R5':9, 'R6':10, 'R7':11, 'AC':12} # registers

flatten = lambda l: [item for sublist in l for item in sublist]

def compiler(opcode):
    ''' Function to return the binary values of the code in the program '''
    global opcodes
    global regs
    global nonsingle_opcode
    global mov_instr
    global count
    global jump_check
    single_opcodes = ['RSTALL', 'SUB', 'MOV02', 'ADDX', 'ADDY', 'MUL', 'ADD', 'LOAD', 'MOV13', 'INCI', 'STORE', 'RSTI', 'OPEND']
    
    if (opcodes.get(opcode) != None):
        if (opcode in single_opcodes): # Handling instructions with no operands
            return opcodes.get(opcode)<<8
        elif (opcode == 'MOV'): # Handling MOV instruction
            mov_instr = opcodes.get(opcode)<<8
            count += 1
            return "Require 2 operands"
        elif (opcode == 'JMPNZ'): # Handling JUMP instruction
            jump_check = 1
            return opcodes.get(opcode)<<8
        else: # Handling other instructions
            nonsingle_opcode = opcodes.get(opcode)<<8
            return "Require 1 operand"
    elif (regs.get(opcode) != None):
        if (count < 2): # Handling the rest of the MOV instruction - getting the first register
            count += 1
            mov_instr = mov_instr + (regs.get(opcode)<<4)
            return "Require 2 operands"
        else: # Handling the rest of the MOV instruction - getting the second register
            count = 0
            return mov_instr + regs.get(opcode)
    else:
        if (jump_check == 1): # Storing the JUMP address as a separate 16 bit value
            jump_check = 0
            return int(opcode)
        else:
            return nonsingle_opcode + int(opcode)
            
if __name__ == "__main__":            

    try:
        with open('program.txt','r') as pr:
                lines = pr.readlines()
                for line in lines:
                    if (';' not in line):
                        print("Syntax Error: Missing ending semicolon")
                        exit()
                w = [l.split(" ") for l in lines]
                words = flatten(w)
                l = len(words)
                print('Number of Opcodes and Operands in the program: ',l)
                print(words)
                print('===============================================')
                for i in range(l):
                    if(';' in words[i]):
                        if (',' in words[i]): # Handling syntax error when there's no space after a comma in a pair of operands
                            print("Syntax error: Expected space after comma.")
                            exit()
                        idx = words[i].find(';')
                        words[i] = words[i][:idx]
                    elif(',' in words[i]):
                        idx = words[i].find(',')
                        if (idx == (len(words[i])-1)):
                            words[i] = words[i][:idx]
                        else: # Handling syntax error when there's no space after a comma in a pair of operands
                            print("Syntax error: Expected space after comma.")
                            exit()

                    if (words[i] not in opcodes): # Handling syntax errors - valid opcodes/operands
                        if (words[i] not in regs.keys()):
                            try:
                                operand = int(words[i])
                            except:
                                print("Syntax error: "+words[i]+" is not a valid opcode/operand.")
                                exit()
                print(words)
    except:
        print("File not found error: No such file: 'program.txt' in current directory")
        exit()

    instructions = []
    for word in words:
        instr = compiler(word)
        if (instr == "Require 1 operand" or instr == "Require 2 operands"):
            continue
        else:
            instructions.append(instr)

    print('===============================================')
    print("Equivalent binary conversion")
    print(instructions)

    with open('Test.txt', 'w') as f:
        for idx,instr in enumerate(instructions):
            f.write("mem[16'd"+str(idx)+"] = 16'd"+str(instr)+";")
            f.write('\n')