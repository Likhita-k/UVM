`define WIDTH 32 
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
typedef enum bit{RD,WR} wr_rd_t;
typedef class mem_agent;
//typedef class mem_bfm;
//typedef class mem_common;
typedef class mem_env;
//typedef class mem_gen;
typedef class mem_tx;
typedef class mem_driver;
typedef class mem_sequencer;
//typedef class mem_monitor;
//typedef class mem_cov;

`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "memory.v"
`include "mem_intf.sv"
`include "mem_agent.sv"
`include "mem_env.sv"
`include "mem_tx.sv"
`include "top.sv"
`include "mem_test.sv"
`include "mem_driver.sv"
`include "mem_sequencer.sv"
//`include "mem_common.sv"
//`include "mem_monitor.sv"
//`include "mem_cov.sv"
//`include "mem_gen.sv"
