
register<bit<16>>(65536) log_table;
register<bit<16>>(131072) ilog_table;

action populate_log_table(){

    log_table.write(hdr.netec_helper.index + 0, hdr.netec_helper.symbol_0);

    log_table.write(hdr.netec_helper.index + 1, hdr.netec_helper.symbol_1);

    log_table.write(hdr.netec_helper.index + 2, hdr.netec_helper.symbol_2);

    log_table.write(hdr.netec_helper.index + 3, hdr.netec_helper.symbol_3);

    log_table.write(hdr.netec_helper.index + 4, hdr.netec_helper.symbol_4);

    log_table.write(hdr.netec_helper.index + 5, hdr.netec_helper.symbol_5);

    log_table.write(hdr.netec_helper.index + 6, hdr.netec_helper.symbol_6);

    log_table.write(hdr.netec_helper.index + 7, hdr.netec_helper.symbol_7);

    log_table.write(hdr.netec_helper.index + 8, hdr.netec_helper.symbol_8);

    log_table.write(hdr.netec_helper.index + 9, hdr.netec_helper.symbol_9);

    log_table.write(hdr.netec_helper.index + 10, hdr.netec_helper.symbol_10);

    log_table.write(hdr.netec_helper.index + 11, hdr.netec_helper.symbol_11);

    log_table.write(hdr.netec_helper.index + 12, hdr.netec_helper.symbol_12);

    log_table.write(hdr.netec_helper.index + 13, hdr.netec_helper.symbol_13);

    log_table.write(hdr.netec_helper.index + 14, hdr.netec_helper.symbol_14);

    log_table.write(hdr.netec_helper.index + 15, hdr.netec_helper.symbol_15);

}

action populate_ilog_table(){

    ilog_table.write(hdr.netec_helper.index + 0, hdr.netec_helper.symbol_0);

    ilog_table.write(hdr.netec_helper.index + 1, hdr.netec_helper.symbol_1);

    ilog_table.write(hdr.netec_helper.index + 2, hdr.netec_helper.symbol_2);

    ilog_table.write(hdr.netec_helper.index + 3, hdr.netec_helper.symbol_3);

    ilog_table.write(hdr.netec_helper.index + 4, hdr.netec_helper.symbol_4);

    ilog_table.write(hdr.netec_helper.index + 5, hdr.netec_helper.symbol_5);

    ilog_table.write(hdr.netec_helper.index + 6, hdr.netec_helper.symbol_6);

    ilog_table.write(hdr.netec_helper.index + 7, hdr.netec_helper.symbol_7);

    ilog_table.write(hdr.netec_helper.index + 8, hdr.netec_helper.symbol_8);

    ilog_table.write(hdr.netec_helper.index + 9, hdr.netec_helper.symbol_9);

    ilog_table.write(hdr.netec_helper.index + 10, hdr.netec_helper.symbol_10);

    ilog_table.write(hdr.netec_helper.index + 11, hdr.netec_helper.symbol_11);

    ilog_table.write(hdr.netec_helper.index + 12, hdr.netec_helper.symbol_12);

    ilog_table.write(hdr.netec_helper.index + 13, hdr.netec_helper.symbol_13);

    ilog_table.write(hdr.netec_helper.index + 14, hdr.netec_helper.symbol_14);

    ilog_table.write(hdr.netec_helper.index + 15, hdr.netec_helper.symbol_15);

}

action mult_0(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_0);
    ilog_table.read(hdr.netec.symbol_0, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_1(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_1);
    ilog_table.read(hdr.netec.symbol_1, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_2(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_2);
    ilog_table.read(hdr.netec.symbol_2, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_3(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_3);
    ilog_table.read(hdr.netec.symbol_3, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_4(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_4);
    ilog_table.read(hdr.netec.symbol_4, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_5(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_5);
    ilog_table.read(hdr.netec.symbol_5, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_6(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_6);
    ilog_table.read(hdr.netec.symbol_6, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_7(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_7);
    ilog_table.read(hdr.netec.symbol_7, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_8(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_8);
    ilog_table.read(hdr.netec.symbol_8, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_9(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_9);
    ilog_table.read(hdr.netec.symbol_9, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_10(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_10);
    ilog_table.read(hdr.netec.symbol_10, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_11(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_11);
    ilog_table.read(hdr.netec.symbol_11, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_12(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_12);
    ilog_table.read(hdr.netec.symbol_12, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_13(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_13);
    ilog_table.read(hdr.netec.symbol_13, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_14(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_14);
    ilog_table.read(hdr.netec.symbol_14, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_15(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_15);
    ilog_table.read(hdr.netec.symbol_15, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_16(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_16);
    ilog_table.read(hdr.netec.symbol_16, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_17(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_17);
    ilog_table.read(hdr.netec.symbol_17, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_18(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_18);
    ilog_table.read(hdr.netec.symbol_18, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }

action mult_19(){
    log_table.read(meta.logarithm, (bit<32>)hdr.netec.symbol_19);
    ilog_table.read(hdr.netec.symbol_19, (bit<32>)(meta.logarithm) + meta.coeff);
     
    }
