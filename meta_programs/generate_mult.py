field_count = 20
for i in range(1,field_count):
    print """
action before_%s(){
    hdr.netec.symbol_%s = meta.symbol;
    meta.symbol = hdr.netec.symbol_%s;
}
""" % (i,i-1,i),

print """
action before_0(){
    meta.symbol = hdr.netec.symbol_0;
}
action after_%s(){
    hdr.netec.symbol_%s = meta.symbol;
}
""" %(field_count-1,field_count-1),

print """
action a_log(bit<16> logarithm){
    meta.logarithm = logarithm + meta.coeff;
}

table log{
    key = {meta.symbol : exact;}
    actions = {a_log;}
    size  = 65536;
}

action a_ilog(bit<16> exponent){
    meta.symbol = exponent;
}

table ilog{
    key = {meta.logarithm : exact;}
    actions = {a_ilog;}
    size  = 131072;
}
""",
