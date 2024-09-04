class adder_base_seq extends uvm_sequence#(adder_tx);

`uvm_object_utils(adder_base_seq)
`NEW_OBJECT

adder_tx tx;
task body();
`uvm_do(req)
tx = new req;
endtask

endclass


