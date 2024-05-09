field_count = 20
for i in range(0,field_count):
    print """
register<bit<16>>(2048) reg%s;
    """ % (i),

print """
action xor(){
""",

for i in range(0,field_count):
    print """
reg%s.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_%s = hdr.netec.symbol_%s ^ meta.temp;
reg%s.write(hdr.netec.index,hdr.netec.symbol_%s);
""" % (i,i,i,i,i),

print """
}"""

