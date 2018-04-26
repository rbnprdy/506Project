from __future__ import print_function

def main():
    #dec("input [31:0]","in","")
    #dec("input","in", "_valid")
    #dec("input","result","_ready")
    #dec("input","in","_ready")
    #dec("output [31:0]","out","")
    #dec("output","out","_valid")
    #dec("output","in_a","_ready")
    #dec("output","in_b","_ready")
    #for i in range(0, 10):
    #    print("{}: begin".format(i))
    #    for n in range(1, 29):
    #        print("\tout{} <= in{}_{};".format(n, n, i))
    #    print("\tout_valid <= in_valid_{};".format(i))
    #    print("end")
    #print("default: begin")
    #for n in range(1, 29):
    #    print("\tout{} <= 0;".format(n))
    #print("\tout_valid <= 0;")
    #print("end")
    for i in range(0, 10):
        dec("wire [31:0]", "out_a","_{}".format(i))
    
    

def dec(typ, name1, name2):
    print("{} ".format(typ), end='')
    for i in range(1, 29):
        print("{}{}{}".format(name1, i, name2), end='')
        if (i == 7 or i == 14 or i == 21 or i == 28):
            print(";")
            if (i != 28):
                print("{} ".format(typ), end='')
        else:
            print(", ", end='')

    
def head(name1, name2):
    for i in range(1, 29):
        print("{}{}{}".format(name1, i, name2), end='')
        if (i == 7 or i == 14 or i == 21 or i == 28):
            print(",")
        else:
            print(", ", end='')

def defineAdder():
    print("adder_32bit(")
    define1("in","","accumulator_out","")
    print("\t.out(adder_out)")
    print(");")
    
def defineAccum():
    print("parallel_accumulators accum(")
    print("\t.clk(clk), .clr(clr), .bypass(multiplier_fixed_out1_valid), //FIXME")
    define1("in","","multiplier_fixed_out","")
    define1("out","","accumulator_out","")
    print(");")

def defineFloatTF():
    print("parallel_float_to_float multiplier_to_fixed(")
    print("\t.clk(clk), .in_valid(in_valid),")
    define1("in", "", "multiplier_out", "")
    define1("in","_valid","multiplier_out","_valid")
    define1("result_","_ready","accumulator_to_float_in","_ready")
    define1("in", "_ready", "multiplier_to_fixed", "_ready")
    define1("out", "", "multiplier_fixed_out", "")
    define1("out", "_valid", "multiplier_fixed_out", "_valid")
    print(");")

def defineFTF():
    print("parallel_fixed_to_float in_to_float(")
    print(".clk(clk), .in_valid(in_valid),")
    define1("in", "", "in", "")
    define1("out", "_ready", "sub_a", "_ready")
    define1("in", "_ready", "in", "_ready")
    define1("out", "", "in_float", "")
    define1("out", "_valid", "in_float", "_valid")
    print(");")

def defineSub():
    print("parallel_subtractors subs(")
    print("\t.clk(clk), .in_b(u), .in_b_valid(u_valid),")
    define1("in_a","","in_float","")
    define1("in_a","_valid","in_float","_valid")
    define1("out","_ready","multiplier_a","_ready")
    define1("out","","sub_out","")
    define1("out","_valid","sub_out","_valid")
    define1("in_a","_ready","sub_a","_ready")
    print("\t.in_b_ready(u_ready)")
    print(");")

def define1(name1, name2, inner1, inner2):
    print("\t", end='')
    for i in range(1, 29):
        print(".{}{}{}({}{}{})".format(name1, i, name2, inner1, i, inner2), end='')
        if (i == 7 or i == 14 or i == 21 or i == 28):
            print(",")
            if (i != 28):
                print("\t", end='')
        else:
            print(", ", end='')

def define_data():
    print("parallel_data_counters data_counters(")
    print("\t.clk(clk), .clr(clr),")
    define1("in","","sub_out","")
    define1("ready","","sub_out","_valid")
    define1("out","","data_counter_out","")
    define1("done","","data_counter_done","")
    print(");")

def define_mult():
    print("parallel_multipliers mults (")
    print("\t.clk(clk),")
    define1("in_a","","data_counter_out","")
    define1("in_a","_valid","sub_out","_valid")
    define1("in_b","","data_counter_out","")
    define1("in_b","_valid","sub_out","_valid")
    define1("result_","_ready","multiplier_to_fixed","_ready")
    define1("in_a","_ready","multiplier_a","_ready")
    define1("in_b","_ready","multiplier_b","_ready")
    define1("out","","multiplier_out","")
    define1("out","_valid","multiplier_out","_valid")
    print(");")

def define_mem_y(num):
    print("parallel_input_memories #(.NUM(\"{}\"), .NUM_ENTRIES(28), .ADDRESS_BIT_WIDTH(5)) mems_y_{}(".format(num, num))
    print("\t.clk(clk),")
    print("\t.rst(clr),")
    print("\t.start_a(start_a),")
    print("\t.start_b(0),")
    print("\t.valid_a(valid_a_{}),".format(num))
    define1("out_a","","out_a","_{}".format(num))
    print(");")

def mult():
    for i in range(1, 29):
        print("multiplier_floating_point mult{} (".format(i))
        print("\t.aclk(clk),")
        print("\t.s_axis_a_tvalid(in_a{}_valid),".format(i))       
        print("\t.s_axis_a_tready(in_a{}_ready),".format(i))
        print("\t.s_axis_a_tdata(in_a{}),".format(i))              
        print("\t.s_axis_b_tvalid(in_b{}_valid),".format(i))            
        print("\t.s_axis_b_tready(in_b{}_ready),".format(i))
        print("\t.s_axis_b_tdata(in_b{}),".format(i))              
        print("\t.m_axis_result_tvalid(out{}_valid),".format(i))
        print("\t.m_axis_result_tready(result_{}_ready),".format(i))
        print("\t.m_axis_result_tdata(out{})".format(i))
        print(");\n ")

def floattf():
    for i in range(1, 29): 
        print("float_to_fixed_converter float_to_fixed_{}(".format(i))
        print("\t.aclk(clk),")
        print("\t.s_axis_a_tvalid(in{}_valid),".format(i))       
        print("\t.s_axis_a_tready(in{}_ready),".format(i))
        print("\t.s_axis_a_tdata(in{}),".format(i))                          
        print("\t.m_axis_result_tvalid(out{}_valid),".format(i))
        print("\t.m_axis_result_tready(result_{}_ready),".format(i))
        print("\t.m_axis_result_tdata(out{})".format(i))
        print(");\n ")
    
def ftf():
    for i in range(1, 29): 
        print("subtractor_floating_point sub{} (".format(i))
        print("\t.aclk(clk),")
        print("\t.s_axis_a_tvalid(in_a{}_valid),".format(i))       
        print("\t.s_axis_a_tready(in_a{}_ready),".format(i))
        print("\t.s_axis_a_tdata(in_a{}),".format(i))              
        print("\t.s_axis_b_tvalid(in_b_valid),")            
        print("\t.s_axis_b_tready(in_b{}_ready),".format(i))
        print("\t.s_axis_b_tdata(in_b),")              
        print("\t.m_axis_result_tvalid(out{}_valid),".format(i))
        print("\t.m_axis_result_tready(out{}_ready),".format(i))
        print("\t.m_axis_result_tdata(out{})".format(i))
        print(");\n ")

def datact():
    for i in range(1, 29): 
        print("data_counter #(.NUM(NUM_INPUTS)) d{} (".format(i))
        print("\t.in(in{}),".format(i))
        print("\t.clk(clk),")
        print("\t.ready(ready{}),".format(i))
        print("\t.clr(clr),")
        print("\t.out(out{}),".format(i))
        print("\t.done(done{})".format(i))
        print(");\n ")
    
if __name__ == '__main__':
    main()
