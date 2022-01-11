This is project of digital ASIC for 9-th order wideband differenciator

Verilog file of the project you can find in Source folder by Subsustem.v name

to create ASIC you need to follow several steps:
1) To run syntgesis open RTL_Complier folder and run RTL_Compiler ../Scripts/MyModule.tcl script
Generated netlist will appear in Source\Top\Synthesis folder
2) To disign layout open folder Encounter and run coomand Encounter ../Source/FIR3_PaR.tcl
Files Top_netlist1.v and Top_netlist_phys.v will appear in Output folder. Top_netlist1.v is dedicated for simulation
Incisive. Top_netlist_phys.v is intended for import in Virtuoso
Also in Output folder Digital_part.sdf, Digital_partMAX.sdf, Digital_partMIN.sdf, Top.def will appear
.sdf files is intended for simulation in Incisive and Top.def file is intended for verification in Virtuoso
3) To make verification pen Virtuoso and import Top_netlist_phys.v and Top.def files
4) Run remaster instances. For seach for viewname write "abstract" and for update for write "layout"
5) Place pins and lables
6) Run DRC and LVS


Reports from RTL Compiler will be in Reports folder
Reports from Encounter will be in Encounter filder
Also yiu can run different corners during RTL_compiler bu using MyModuleMax.tcl or MyModuleMin.tcl scripts

For simulation of verilof file or generated nelist you can use Subsystem_tb.v file
For simulating generated nelist and layout you need to use VLG_PRIMITIVES.v and D_CELLS_HD.v
For simulating layout use Subsystem_tb_ENCOUNER.v testbench file