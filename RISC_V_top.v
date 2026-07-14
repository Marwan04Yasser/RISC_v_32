module RISC_V_top (input CLK);

    // Instantiation of Instruction_mem
    wire [31:0] PC, PCPlus, PCNext, PCTarget, ImmExt, Instr, Result, ReadData, WriteData, alu_res, srcA, srcB;
    wire        RegWrite, ResultSrc, PCSrc, ALUSrc, Zero, MemWrite, Jump;
    wire [1:0]  ImmSrc;
    wire [2:0]  ALUcontrol;

    //
    Control_unit CU_inst    (Instr, Zero, PCSrc, ResultSrc, MemWrite, ALUSrc, RegWrite, Jump, ImmSrc, ALUcontrol);
    ALU          alu_inst   (srcA, srcB, ALUcontrol, alu_res, Zero);

    //
    PCPlus_4     pcplus_inst(PC, PCPlus);
    mux_2_1 #(32) mux1      (PCSrc, PCTarget, PCPlus, PCNext);
    PC_count     count      (CLK, PCNext, PC);
    PCTarget     pc_inst    (ImmExt, PC, PCTarget);
    Extend       extend_inst(Instr[31:7], ImmSrc, ImmExt);

    //
    Instruction_mem #(100) instr_mem_inst(PC, Instr);

    //
    reg_file reg_inst(CLK, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], Result, srcA, srcB);
    mux_2_1 #(32) mux2(ALUSrc, ImmExt, WriteData, srcB);

    //
    data_mem #(100) dat_mem_inst(CLK, MemWrite, alu_res, WriteData, ReadData);
    mux_2_1  #(32) mux3(ResultSrc, ReadData, alu_res, Result);

endmodule
