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
# File: vga_cartoon.tcl
# Generated on: Thu Mar 26 19:12:03 2020

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "vga_cartoon"]} {
		puts "Project vga_cartoon is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists vga_cartoon]} {
		project_open -revision vga_cartoon vga_cartoon
	} else {
		project_new -revision vga_cartoon vga_cartoon
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone 10 LP"
	set_global_assignment -name DEVICE 10CL006YU256C8G
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 18.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "18:02:40  MARCH 26, 2020"
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
	set_global_assignment -name VERILOG_FILE vga_disp.v
	set_global_assignment -name VERILOG_FILE vga_cartoon_tb.v
	set_global_assignment -name VERILOG_FILE vga_cartoon.v
	set_global_assignment -name VERILOG_FILE rom_rgb.v
	set_global_assignment -name VERILOG_FILE cartoon_ctr.v
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name QIP_FILE pll.qip
	set_global_assignment -name EDA_TEST_BENCH_ENABLE_STATUS TEST_BENCH_MODE -section_id eda_simulation
	set_global_assignment -name EDA_NATIVELINK_SIMULATION_TEST_BENCH vga_cartoon_tb -section_id eda_simulation
	set_global_assignment -name EDA_TEST_BENCH_NAME vga_cartoon_tb -section_id eda_simulation
	set_global_assignment -name EDA_DESIGN_INSTANCE_NAME NA -section_id vga_cartoon_tb
	set_global_assignment -name EDA_TEST_BENCH_MODULE_NAME vga_cartoon_tb -section_id vga_cartoon_tb
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name EDA_TEST_BENCH_FILE vga_cartoon_tb.v -section_id vga_cartoon_tb
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
	set_location_assignment PIN_K15 -to VGA_D[11]
	set_location_assignment PIN_L16 -to VGA_D[10]
	set_location_assignment PIN_L15 -to VGA_D[9]
	set_location_assignment PIN_N16 -to VGA_D[8]
	set_location_assignment PIN_J11 -to VGA_D[7]
	set_location_assignment PIN_J16 -to VGA_D[6]
	set_location_assignment PIN_J15 -to VGA_D[5]
	set_location_assignment PIN_K16 -to VGA_D[4]
	set_location_assignment PIN_F15 -to VGA_D[3]
	set_location_assignment PIN_F16 -to VGA_D[2]
	set_location_assignment PIN_G15 -to VGA_D[1]
	set_location_assignment PIN_G16 -to VGA_D[0]
	set_location_assignment PIN_P16 -to VGA_HSYNC
	set_location_assignment PIN_N15 -to VGA_VSYNC
	set_location_assignment PIN_E1 -to key[1]
	set_location_assignment PIN_F3 -to key[0]
	set_location_assignment PIN_M1 -to reset_n
	set_location_assignment PIN_E15 -to clk50M
	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
