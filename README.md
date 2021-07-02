# Multicore-Processor-Design

[Visualization tool](https://processor-viz.vercel.app/) 

[Data path - Drawing](https://excalidraw.com/#room=da2c671caaf58b164a9d,DCDCAfTVAIliZtm77NxS7w) 

[Google Sheet](https://docs.google.com/spreadsheets/d/1NWz1I4V-Qkjd-4clPymhBjzXFpGxIdW4pcBSh-9wjCw/edit#gid=811509892) 


# Steps to change the number of cores

1. Update **DL_Controller.v**
    1. Add/ remove following inputs/ outputs/ wires to match the number of cores.
        * MR
        * MADDR
        * DOUT
        * out
    2. Edit the line **"assign MEMREAD = "** accordingly.
    3. Add/ remove mulitplexers (**DL_MUX**) and change their inputs and outputs accordingly.
    4. Add/ remove **"assign DOUT"** lines accordingly.
2. Update **Registers.v**
    1. Add/ remove following inputs/ outputs/ wires to match the number of cores.
        * STORE_ADD
        * DATAIN
        * MEMWR
    2. Edit the line **"assign MEMWR = "** accordingly.
    3. Add/ remove **case (STORE_ADD)** statements accordingly in the second **always** block.
3. Update **opend_flag.v**
    1. Add/ remove following inputs/ outputs/ wires to match the number of cores.
        * op
    2. Edit the line **"assign and_out = "** accordingly.
    3. Change the **always** statement accordingly.
4. Update **StoreController.v**
    1. Add/ remove following inputs/ outputs/ wires to match the number of cores.
        * op
    2. Change the **op** signals in the **opend_flag** instance accordingly.
5. Update **StoreCtrlwithRegisters.v**
    1. Add/ remove following inputs/ outputs/ wires to match the number of cores.
        * op
        * regAddr
        * data
        * WR
    2. Change the inputs and outputs to module instances accordingly.
6. Update **MemoryController.v**
    1. Add/ remove following signals to match the number of cores.
        * op
        * regAddr
        * data
        * WR
        * MR
        * DOUT
    2. Change the inputs and outputs to module instances accordingly. (**DataLoad, storeCtrlandReg**)
7. Update **INS_Ctrl.v**
    1. Add/ remove following signals to match the number of cores.
        * insaddr
        * IMR
    2. Edit the line **"assign IMREAD = "** accordingly.
    3. Edit the line **"assign insaddr = "** accordingly.
8. Update **quadcoreProcessor.v**
    1. *Change the module name and filename according to the number of cores.*
        * One core -> singlecoreProcessor
        * Two cores -> dualcoreProcessor
        * Eight cores -> octacoreProcessor
        * Sixteen cores -> hexacoreProcessor
    2. Add/ remove following wires to match the number of cores.
        * DATAIN
        * DMADDR
        * IMADDR
        * DATAOUT
        * MEMREAD
        * MEMWR
        * INSREAD
        * OPEND
    3. Add/ remove cores (change IDX and IDY accordingly).
    4. Change the inputs and outputs to module instances accordingly. (**memoryControl, IMInterface**)
