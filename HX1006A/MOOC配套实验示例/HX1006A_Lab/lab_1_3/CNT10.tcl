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
# File: CNT10.tcl
# Generated on: Wed Oct 02 22:05:20 2019

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "CNT10"]} {
		puts "Project CNT10 is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists CNT10]} {
		project_open -revision CNT10 CNT10
	} else {
		project_new -revision CNT10 CNT10
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone 10 LP"
	set_global_assignment -name DEVICE 10CL006YU256C8G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "20:58:50  OCTOBER 02, 2019"
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
	set_global_assignment -name VERILOG_FILE CNT10.v
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VERILOG_FILE CNT10_TB.v
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH CNT10_TB -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST ON -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_NAME CNT10_TB -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME U1 -section_id CNT10_TB
	set_global_assignment -name EDA_TEST_BENCH_RUN_SIM_FOR "2 us" -section_id CNT10_TB
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME CNT10_TB -section_id CNT10_TB
	set_global_assignment -name EDA_TEST_BENCH_FILE CNT10_TB.v -section_id CNT10_TB
	set_location_assignment PIN_K10 -to COUT
	set_location_assignment PIN_T10 -to DOUT[3]
	set_location_assignment PIN_R9 -to DOUT[2]
	set_location_assignment PIN_T9 -to DOUT[1]
	set_location_assignment PIN_K8 -to DOUT[0]
	set_location_assignment PIN_E15 -to CLK_50
	set_location_assignment PIN_E2 -to KEY[2]
	set_location_assignment PIN_E1 -to KEY[1]
	set_location_assignment PIN_F3 -to KEY[0]
	set_location_assignment PIN_M15 -to SW[2]
	set_location_assignment PIN_M2 -to SW[3]
	set_location_assignment PIN_M16 -to SW[1]
	set_location_assignment PIN_E16 -to SW[0]
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
