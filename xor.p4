
register<bit<16>>(2048) reg0;
     
register<bit<16>>(2048) reg1;
     
register<bit<16>>(2048) reg2;
     
register<bit<16>>(2048) reg3;
     
register<bit<16>>(2048) reg4;
     
register<bit<16>>(2048) reg5;
     
register<bit<16>>(2048) reg6;
     
register<bit<16>>(2048) reg7;
     
register<bit<16>>(2048) reg8;
     
register<bit<16>>(2048) reg9;
     
register<bit<16>>(2048) reg10;
     
register<bit<16>>(2048) reg11;
     
register<bit<16>>(2048) reg12;
     
register<bit<16>>(2048) reg13;
     
register<bit<16>>(2048) reg14;
     
register<bit<16>>(2048) reg15;
     
register<bit<16>>(2048) reg16;
     
register<bit<16>>(2048) reg17;
     
register<bit<16>>(2048) reg18;
     
register<bit<16>>(2048) reg19;
     
action xor(){

reg0.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_0 = hdr.netec.symbol_0 ^ meta.temp;
reg0.write(hdr.netec.index,hdr.netec.symbol_0);

reg1.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_1 = hdr.netec.symbol_1 ^ meta.temp;
reg1.write(hdr.netec.index,hdr.netec.symbol_1);

reg2.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_2 = hdr.netec.symbol_2 ^ meta.temp;
reg2.write(hdr.netec.index,hdr.netec.symbol_2);

reg3.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_3 = hdr.netec.symbol_3 ^ meta.temp;
reg3.write(hdr.netec.index,hdr.netec.symbol_3);

reg4.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_4 = hdr.netec.symbol_4 ^ meta.temp;
reg4.write(hdr.netec.index,hdr.netec.symbol_4);

reg5.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_5 = hdr.netec.symbol_5 ^ meta.temp;
reg5.write(hdr.netec.index,hdr.netec.symbol_5);

reg6.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_6 = hdr.netec.symbol_6 ^ meta.temp;
reg6.write(hdr.netec.index,hdr.netec.symbol_6);

reg7.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_7 = hdr.netec.symbol_7 ^ meta.temp;
reg7.write(hdr.netec.index,hdr.netec.symbol_7);

reg8.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_8 = hdr.netec.symbol_8 ^ meta.temp;
reg8.write(hdr.netec.index,hdr.netec.symbol_8);

reg9.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_9 = hdr.netec.symbol_9 ^ meta.temp;
reg9.write(hdr.netec.index,hdr.netec.symbol_9);

reg10.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_10 = hdr.netec.symbol_10 ^ meta.temp;
reg10.write(hdr.netec.index,hdr.netec.symbol_10);

reg11.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_11 = hdr.netec.symbol_11 ^ meta.temp;
reg11.write(hdr.netec.index,hdr.netec.symbol_11);

reg12.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_12 = hdr.netec.symbol_12 ^ meta.temp;
reg12.write(hdr.netec.index,hdr.netec.symbol_12);

reg13.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_13 = hdr.netec.symbol_13 ^ meta.temp;
reg13.write(hdr.netec.index,hdr.netec.symbol_13);

reg14.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_14 = hdr.netec.symbol_14 ^ meta.temp;
reg14.write(hdr.netec.index,hdr.netec.symbol_14);

reg15.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_15 = hdr.netec.symbol_15 ^ meta.temp;
reg15.write(hdr.netec.index,hdr.netec.symbol_15);

reg16.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_16 = hdr.netec.symbol_16 ^ meta.temp;
reg16.write(hdr.netec.index,hdr.netec.symbol_16);

reg17.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_17 = hdr.netec.symbol_17 ^ meta.temp;
reg17.write(hdr.netec.index,hdr.netec.symbol_17);

reg18.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_18 = hdr.netec.symbol_18 ^ meta.temp;
reg18.write(hdr.netec.index,hdr.netec.symbol_18);

reg19.read(meta.temp,hdr.netec.index);
hdr.netec.symbol_19 = hdr.netec.symbol_19 ^ meta.temp;
reg19.write(hdr.netec.index,hdr.netec.symbol_19);

}
