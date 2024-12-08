#!/usr/bin/env python3

in_text = False;

print("char *sus_text = \"", end="")

with open("tccpp.c") as file:
    for line in file:  
        if line == "struct sus_file {\n":
            in_text = True
        if line.startswith("char *sus_text = "):
            in_text = False 
        if in_text:
            for c in line.strip(): 
                match c:
                    case "\"" | "\\":
                        print("\\", end="")
                print(c, end="")

print("\";")

