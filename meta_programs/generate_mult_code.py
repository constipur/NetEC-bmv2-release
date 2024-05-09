field_count = 20
for i in range(0,field_count-1):
    print """
    before_%s();
    log.apply();
    ilog.apply();
    """ % (i),
    
print """
    after_%s();""" %(field_count-1),