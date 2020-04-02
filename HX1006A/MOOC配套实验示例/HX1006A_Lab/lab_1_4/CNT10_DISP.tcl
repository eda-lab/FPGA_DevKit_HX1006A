# Copyright (C) 2018  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: CNT10_DISP.tcl
# Generated on: Wed Oct 02 11:30:06 2019

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "CNT10_DISP"]} {
		puts "Project CNT10_DISP is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists CNT10_DISP]} {
		project_open -revision CNT10_DISP CNT10_DISP
	} else {
		project_new -revision CNT10_DISP CNT10_DISP
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone 10 LP"
	set_global_assignment -name DEVICE 10CL006YU256C8G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "11:21:54  OCTOBER 02, 2019"
	set_global_assignment -name LAST_QUARTUS_VERSION "18.1.0 Standard Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 256
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 8
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1
	set_global_assignment -name NOMINAL_CORE_SUPPLY_VOLTAGE 1.2V
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name VERILOG_FILE CNT10_DISP.v
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST ON -section_id eda_simulation
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	
	set_location_assignment PIN_T9 -to DOUT[1]
	set_location_assignment PIN_R9 -to DOUT[2]
	set_location_assignment PIN_T10 -to DOUT[3]
	set_location_assignment PIN_K8 -to DOUT[0]
	set_location_assignment PIN_E15 -to CLK_50
	set_location_assignment PIN_E1 -to KEY[2]
	set_location_assignment PIN_K10 -to COUT
	set_location_assignment PIN_F3 -to KEY[1]
	set_location_assignment PIN_M1 -to KEY[0]
	set_location_assignment PIN_M15 -to SW[2]
	set_location_assignment PIN_M2 -to SW[3]
	set_location_assignment PIN_M16 -to SW[1]
	set_location_assignment PIN_E16 -to SW[0]
	
	set_location_assignment PIN_A10 -to DIG[7]
	set_location_assignment PIN_A11 -to DIG[6]
	set_location_assignment PIN_A12 -to DIG[5]
	set_location_assignment PIN_A13 -to DIG[4]
	set_location_assignment PIN_A14 -to DIG[3]
	set_location_assignment PIN_A15 -to DIG[2]
	set_location_assignment PIN_C15 -to DIG[1]
	set_location_assignment PIN_D15 -to DIG[0]
	set_location_assignment PIN_B10 -to SEL[7]
	set_location_assignment PIN_B11 -to SEL[6]
	set_location_assignment PIN_B12 -to SEL[5]
	set_location_assignment PIN_B13 -to SEL[4]
	set_location_assignment PIN_B14 -to SEL[3]
	set_location_assignment PIN_B16 -to SEL[2]
	set_location_assignment PIN_C16 -to SEL[1]
	set_location_assignment PIN_D16 -to SEL[0]

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
