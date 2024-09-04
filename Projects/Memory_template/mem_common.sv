class mem_common;
static string testname;
static int num_tx = `DEPTH;
static mailbox #(mem_tx) gen2bfm = new(num_tx);
static mailbox#(mem_tx) mon2cov = new(num_tx);
endclass
