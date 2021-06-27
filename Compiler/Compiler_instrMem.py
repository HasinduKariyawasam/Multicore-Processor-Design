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
print("Opcodes:\n")
print(opcodes)

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
    single_opcodes = ['RSTALL', 'SUB', 'MOV02', 'ADDX', 'ADDY', 'MUL', 'ADD', 'LOAD', 'MOV13', 'INCI', 'STORE', 'RSTI']
    
    if (opcodes.get(opcode) != None):
        if (opcode in single_opcodes): # Handling instructions with no operands
            return opcodes.get(opcode)
        elif (opcode == 'MOV'): # Handling MOV instruction
            mov_instr = opcodes.get(opcode)
            count += 1
            return "Require 2 operands"
        elif (opcode == 'JMPNZ'): # Handling JUMP instruction
            jump_check = 1
            return opcodes.get(opcode)
        else: # Handling other instructions
            nonsingle_opcode = opcodes.get(opcode)
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

    with open('program.txt','r') as pr:
            lines = pr.readlines()
            w = [l.split(" ") for l in lines]
            words = flatten(w)
            l = len(words)
            print('Number of Opcodes and Operands in the program: ',l)
            print(words)
            print('===============================================')
            for i in range(l):
                if(';' in words[i]):
                    idx = words[i].find(';')
                    words[i] = words[i][:idx]
                elif(',' in words[i]):
                    idx = words[i].find(',')
                    words[i] = words[i][:idx]
            print(words)

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

    with open('INS_MEM.txt', 'w') as f:
        for instr in instructions:
            f.write("{0:016b}".format(instr))
            f.write('\n')