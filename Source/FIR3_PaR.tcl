#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Mon Nov 29 12:03:20 2021                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.28-s033_1 (64bit) 03/21/2016 13:34 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.28-s005 NR160313-1959/14_28-UB (database version 2.30, 267.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.28-s006_1 (64bit) 03/08/2016 00:08:23 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.28-s002 (64bit) 03/21/2016 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.28-s007_1 (64bit) Mar  7 2016 23:11:05 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.28-s006
#@(#)CDS: IQRC/TQRC 14.2.2-s217 (64bit) Wed Apr 15 23:10:24 PDT 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win


#Initial settings
set init_gnd_net VSS
set init_lef_file {/Cadence/Libs/X_FAB/XKIT/xt018/cadence/v5_0/techLEF/v5_0_2/xt018_xx43_HD_MET4_METMID_METTHK.lef /Cadence/Libs/X_FAB/XKIT/xt018/diglibs/D_CELLS_HD/v4_0/LEF/v4_0_0/xt018_D_CELLS_HD.lef}
set init_design_settop 0
set init_verilog ../Source/Top/Synthesis/Top_synth.v
set init_mmmc_file ../Scripts/MMMC.tcl
set init_io_file ../Source/Module_pins
set init_pwr_net VDD
init_design

#Set Floorplan
floorPlan -fplanOrigin center -site core_hd -r 1 0.5 10.08 10.37 10.08 10.37
floorPlan -fplanOrigin center -site core_hd -r 1 0.5 10.08 10.37 10.08 10.37
#Set Global Nets
clearGlobalNets
globalNetConnect VDD -type pgpin -pin vdd -inst * -module {}
globalNetConnect VSS -type pgpin -pin gnd -inst * -module {}
globalNetConnect VSS -type tielo -pin gnd -inst * -module {}
globalNetConnect VDD -type tiehi -pin vdd -inst * -module {}
#add Ring

set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0


addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -type core_rings -jog_distance 2.8 -threshold 2.8 -nets {VDD VSS} -follow core -stacked_via_bottom_layer MET1 -layer {bottom MET1 top MET1 right MET2 left MET2} -width 3 -spacing {bottom 0.23 top 0.23 right 0.28 left 0.28} -offset 3.15
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0

#add Stripe
addStripe -skip_via_on_wire_shape Noshape -block_ring_top_layer_limit MET3 -max_same_layer_jog_length 6 -padcore_ring_bottom_layer_limit MET1 -set_to_set_distance 100 -skip_via_on_pin Standardcell -stacked_via_top_layer METTPL -padcore_ring_top_layer_limit MET3 -spacing 2.5 -merge_stripes_value 2.8 -layer MET2 -block_ring_bottom_layer_limit MET1 -width 3 -nets {VDD VSS} -stacked_via_bottom_layer MET1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { MET1 MET4 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { MET1 MET4 } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { MET1 MET4 }


#Preplacemant timing report
timeDesign -prePlace -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix Subsystem_prePlace -outDir timingReports
setPlaceMode -fp false

#Placemant
placeDesign -inPlaceOpt


#pre CTS timing report
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports
#Optimization
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -preCTS


#preCTC post opt timing report
timeDesign -preCTS -idealClock -pathReports -drvReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports

timeDesign -preCTS -hold -idealClock -pathReports -slackReports -numPaths 50 -prefix Subsystem_preCTS -outDir timingReports
createClockTreeSpec -bufferList {BUHDX0 BUHDX1 BUHDX12 BUHDX2 BUHDX3 BUHDX4 BUHDX6 BUHDX8 DLY1HDX0 DLY1HDX1 DLY2HDX0 DLY2HDX1 DLY4HDX0 DLY4HDX1 DLY8HDX0 DLY8HDX1 INHDX0 INHDX1 INHDX12 INHDX2 INHDX3 INHDX4 INHDX6 INHDX8 STEHDX0 STEHDX1 STEHDX2} -file Clock.ctstch




#CTS
setCTSMode -engine ck
clockDesign -specFile Clock.ctstch -outDir clock_report -fixedInstBeforeCTS

#PostCTS timing report
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix Subsystem_postCTS -outDir timingReports

timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix Subsystem_postCTS -outDir timingReports
setOptMode -fixCap true -fixTran true -fixFanoutLoad true

#Post CTS Design optimization
optDesign -postCTS
optDesign -postCTS -hold

#setOptMode -fixCap false -fixTran false -fixFanoutLoad false
#optDesign -postCTS -incr
#optDesign -postCTS -hold -incr
win

#Post CTS post opt timing report
timeDesign -postCTS -pathReports -slackReports -numPaths 50 -prefix Subsystem_postCTS -outDir timingReports

timeDesign -postCTS -hold -pathReports -slackReports -numPaths 50 -prefix Subsystem_postCTS -outDir timingReports

#Routing
setNanoRouteMode -quiet -routeTopRoutingLayer 4
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail


#Post Routing timing report
setAnalysisMode -analysisType onChipVariation -skew true -clockPropagation sdcControl

timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix Subsystem_postRoute -outDir timingReports

timeDesign -postRoute -pathReports -slackReports -numPaths 50 -prefix Subsystem_postRoute -outDir timingReports

timeDesign -postRoute -pathReports -slackReports -numPaths 50 -prefix Subsystem_postRoute -outDir timingReports

#Post Routing opt
setOptMode -fixCap true -fixTran true -fixFanoutLoad true
optDesign -postRoute
optDesign -postRoute -hold


#setOptMode -fixCap false -fixTran false -fixFanoutLoad false
#optDesign -postRoute -incr
#optDesign -postRoute -hold -incr
win

#Post Routing post opt timing report

timeDesign -postRoute -hold -pathReports -slackReports -numPaths 50 -prefix Subsystem_postRoute -outDir timingReports

timeDesign -postRoute -pathReports -slackReports -numPaths 50 -prefix Subsystem_postRoute -outDir timingReports




getFillerMode -quiet

#adding fillers

getFillerMode -quiet
addFiller -cell FEED7HD FEED5HD FEED3HD FEED2HD FEED25HD FEED1HD FEED15HD FEED10HD -prefix FILLER

#Veryfy
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verify_drc -report Subsystem.drc.rpt -limit 1000
verifyConnectivity -type all -error 1000 -warning 50

#extracting RC
setExtractRCMode -engine postRoute -effortLevel signoff
extractRC


#Signoff timing opt
#setDelayCalMode -engine  signalStorm -SIAware auto
#setOptMode -fixCap true -fixTran true -fixFanoutLoad true
#optDesign -postRoute -signOff
#optDesign -postRoute -signOff -hold



#setDelayCalMode -engine signalStorm -SIAware false
#setOptMode -fixCap true -fixTran true -fixFanoutLoad true
#optDesign -postRoute -signOff



#Signoff timing report


timeDesign -signoff -pathReports -slackReports -numPaths 50 -prefix Subsystem_signOff -outDir timingReports

timeDesign -signoff -hold -pathReports -slackReports -numPaths 50 -prefix Subsystem_signOff -outDir timingReports

setOptMode -fixCap true -fixTran true -fixFanoutLoad true

all_hold_analysis_views 
all_setup_analysis_views 
######

write_sdf -view MAXview  -ideal_clock_network ../Output/Digital_partMAX.sdf
write_sdf -view MAXview  -ideal_clock_network ../Output/Digital_partMAX.sdf
write_sdf -view MINview  -ideal_clock_network ../Output/Digital_partMIN.sdf

#Netlist saving
saveNetlist ../Output/Top_netlist1.v

saveNetlist ../Output/Top_netlist_phys.v -includePhysicalCell {FEED7HD FEED5HD FEED3HD FEED2HD FEED25HD FEED1HD FEED15HD FEED10HD}


global dbgLefDefOutVersion
set dbgLefDefOutVersion 5.8
defOut -floorplan -netlist -routing ../Output/Top.def
set dbgLefDefOutVersion 5.8




