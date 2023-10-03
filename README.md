# uvm_seq_det
This repo contains:
- Design RTL for sequence detector "1011".
- SV-UVM environment to verify the design.
- It is inteded for most sequence detector FSM as it is modular environment.
param_macro.svh file contains LENGTH parameter it can be modified according to the length of the sequence (i.e. LENGTH = 4 as seq_1011.v DUT checks for sequence length "1011")
