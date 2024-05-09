print """
register<bit<16>>(65536) log_table;
register<bit<16>>(131072) ilog_table;
""",

field_count = 20

helper_field_count = 16;

print """
action populate_log_table(){
""",
for i in range(0,helper_field_count):
    print """
    log_table.write(hdr.netec_helper.index + %s, hdr.netec_helper.symbol_%s);
""" % (i,i),

print """
}"""

print """
action populate_ilog_table(){
""",
for i in range(0,helper_field_count):
    print """
    ilog_table.write(hdr.netec_helper.index + %s, hdr.netec_helper.symbol_%s);
""" % (i,i),

print """
}"""


for i in range(0,field_count):
    print """
action mult_%s(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_%s);
    ilog_table.read(hdr.netec.symbol_%s, (bit<32>)(meta.logarithm) + meta.coeff);
    """ % (i,i,i),
    # if i == 0:
    #     print"""
    # hdr.ipv4.identification = meta.logarithm;
    # hdr.ipv4.srcAddr = (bit<32>)meta.logarithm + meta.coeff;
    # """
    print """
    }"""
    
