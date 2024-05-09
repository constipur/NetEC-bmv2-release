field_count = 20;
for i in range(0,field_count):
    print """
    if(hdr.netec.symbol_%s != 0){
        mult_%s();
    }""" %(i,i),