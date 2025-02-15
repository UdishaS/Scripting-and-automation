import os
import numpy as np
import pandas as pd1
import shutil
import csv

models = os.listdir("Modules") #modules list as array 
print(models)

top_modules = []
for mod in models:
    if (mod[:3]=='top'):
        top_modules.append(mod[:-2])
    print(mod)
print(top_modules)

os.system("vivado -mode batch -source tcl_create2.tcl")   #creating new project

for mod1 in models:
    os.system("vivado -mode batch -source  tcl_add2.tcl -tclargs {}".format(mod1))

os.mkdir("results")

for filename in models:
    os.mkdir("results/"+filename[:-2])
    os.system("vivado -mode batch -source  tcl_run2.tcl -tclargs {}".format(filename))
    print("{} reported".format(filename)) 


    

