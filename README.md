# Scripting-and-Automation-using-tcl-scripts
In this repository, TCL scripts are provided, enabling the generation of essential results such as power, delay, area, etc., for multiple Verilog modules with a single click using Python. The benefit of employing TCL scripts is that there is no need to manually open VIVADO for each module and execute Synthesis and Implementation steps; the script automates these processes in the background.

## Detailed Explaination
To begin scripting, you need to configure the .tcl file according to your requirements, specifying details such as the board type and desired data files. Additionally, create a "Modules" folder in the present working directory and save all your Verilog files with a .v format inside this folder. It's important to ensure that there are similarities in the naming of these Verilog files. For instance, in this case, all modules are named starting with "top" This naming convention facilitates listing the modules and serves as a common link for comparison and appending during the script execution.

As you review the Python script, you'll notice the need to import several modules, including os, pandas, numpy, and csv. Once imported, Python initiates the process of converting the Verilog files located in the "Modules" folder into a list. This list is crucial as it determines the loop runtime of the script.

In the Python script, three TCL scripts from the repository are utilized. The initial script, tcl_create.tcl, serves the purpose of creating a Vivado project folder.

![create](https://github.com/5ANS5/Scripting-and-Automation-using-tcl-scripts/assets/155957419/5566e757-2063-4762-8b04-96c69cc81392)

The second script is tcl_add.tcl, which adds all the modules located in the [pwd]/Modules folder to the created project.

![add](https://github.com/5ANS5/Scripting-and-Automation-using-tcl-scripts/assets/155957419/17e4231a-da70-45e6-bf0d-df70bc7cfec3)

The "for" loop utilized above iterates until all the modules are added to the project. The number of iterations is determined by the serial number in the previously formed list.

The third tcl file is designed for initiating the implementation and synthesis processes for each module.

![run](https://github.com/5ANS5/Scripting-and-Automation-using-tcl-scripts/assets/155957419/84ccc0b6-04ad-4dcb-bee6-283e4b610d83)

The run file is designed to execute Synthesis and Implementation for all modules. In the 'tcl_run.tcl' script, it is configured to update each module as the top module during each iteration of the loop. The 'mkdir' command creates a directory named "results" in which a subfolder, "[pwd]/results/{module_name}," is generated for each module as the loop progresses.

# Creation of output file
![list of reults](https://github.com/5ANS5/Scripting-and-Automation-using-tcl-scripts/assets/155957419/6ffae590-bd00-4564-9dd9-09f740e69f00)

The provided code is utilized to generate a list of all the files saved in the "[pwd]/results/{module_name}" folder. This list serves as a loop variable for subsequent operations. Additionally, a matrix is created to store the specific data intended for the final output. This approach is adopted to filter and retain only the relevant data generated post-implementation, omitting unnecessary information.

![last 2nd](https://github.com/5ANS5/Scripting-and-Automation-using-tcl-scripts/assets/155957419/6d875663-dcc6-4a62-98e1-24c29f59c493)

The provided code iterates through each "results" folder and its sub-folders. In this process, the script opens the file generated after implementation. Each line of the file is splitted it into words, and the script checks for a specific word using an if condition. Once the condition is met, the data following that word is extracted and stored in the previously defined matrix.

Finally, Pandas is utilized to organize the columns, and the generated results are exported as a CSV file using the CSV module. 
(The resulting CSV file is uploaded to the repository.)
