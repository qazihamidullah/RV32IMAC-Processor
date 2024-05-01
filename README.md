# RISCY-SEECS RISC-V CPU
RISCY-SEECS is a 5-stage, single-issue, in-order CPU which implements the 32-bit RISC-V instruction set. It fully implements I, M, A and C extensions as specified in Volume I: User-Level ISA V 2.3. 

<img src="doc/images/Pipelined-IMCA%20(2).drawio.png"/>

# Quick Setup
You can clone this repository. This repository includes the following: 
- The design folder contains all the design files. Inside this folder we have multiple folders: core, uncore, soc_top, ips.
- The doc folder contains all the documentations, images and block diagrams of different components used in this core. They are clearly visible and easy to understand. 
- The scripts folder contains python scripts which are used for the verification of the core.
- The verif folder contains all the test cases that are used to verify the core. Note that all the cases are not uploaded due to large size of the cases but five seeds of each tests are uploaded in separate folders in an organized manner. The way folders are sorted and created makes it more understandble and easier to use.

Note: In order to simulate this you must have have a simulator. It has been simulated on QuestaSim and Cadence. If you have access to RISC-V Design Verification framework of Chips Alliance you just have to use the design folder and simulate it. 

# Running Simulations
You must  have the following softwares: 
- In order to simulate the design you must have QuestaSim or any other simulator installed.
- You must have Python3 installed.

The makefile available verif/sim will be used directly to simulate the design. Note: The makefile is written to be used for QuestaSim only. If you have any other simulator you must include its run command instead of the QuestaSim run command. 
- The sim fodler contains the makefile, filelist, bash scripts and hex file for memory initialization. 
The bash script run_test.sh will be used if you want to run any particular test case of any architecture like rv32i, rv32im, rv32imc or rv32imac. 
The init.sh sceipt will run all the test cases alongwith all the seeds inside them so it will take a while if you run it. This will run all the test cases of all architectures.

# How it works
All the testcases are available in verif/dv_tests folder. Inside it there are different test cases available for different architecture. Inside each architecture there are different seeds and each seed has iss.log file alonwith it. This log is generated after simulating the corresponding seed in spike simulator. 
Now when we run the test.hex file available in each seed on our core we dump what our core write in register file, alongwith Program counter instruction and the value it writes in register file. The scripts availble in the script folder converts this file and generate a trace.log file.
Another scipt availble inside the script foder compare the core.log and iss.log and tell us if there are any mismatch occur. 
This verification framework is based on UVM. 
