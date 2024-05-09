#include <core.p4>
#include <v1model.p4>

struct metadata {
    bit<2> count;
    bit<16> temp;
    bit<32> index;
    
    bit<16> symbol;
    bit<16> logarithm;
    bit<32> coeff;

    bit<16> ip_proto_16;
    bit<16> l4_length;
}

header ethernet_t {
    bit<48> dstAddr;
    bit<48> srcAddr;
    bit<16> etherType;
}

header ipv4_t {
    bit<4>  version;
    bit<4>  ihl;
    bit<8>  diffserv;
    bit<16> totalLen;
    bit<16> identification;
    bit<3>  flags;
    bit<13> fragOffset;
    bit<8>  ttl;
    bit<8>  protocol;
    bit<16> hdrChecksum;
    bit<32> srcAddr;
    bit<32> dstAddr;
}
header udp_h {
    bit<16> src_port;
    bit<16> dst_port;
    bit<16> hdr_length;
    bit<16> checksum;
}
header netec_helper_h{
    bit<32> index;
    bit<16> symbol_0;
    bit<16> symbol_1;
    bit<16> symbol_2;
    bit<16> symbol_3;
    bit<16> symbol_4;
    bit<16> symbol_5;
    bit<16> symbol_6;
    bit<16> symbol_7;
    bit<16> symbol_8;
    bit<16> symbol_9;
    bit<16> symbol_10;
    bit<16> symbol_11;
    bit<16> symbol_12;
    bit<16> symbol_13;
    bit<16> symbol_14;
    bit<16> symbol_15;
}
header netec_h{
    bit<32> index;
    bit<16> symbol_0;
    bit<16> symbol_1;
    bit<16> symbol_2;
    bit<16> symbol_3;
    bit<16> symbol_4;
    bit<16> symbol_5;
    bit<16> symbol_6;
    bit<16> symbol_7;
    bit<16> symbol_8;
    bit<16> symbol_9;
    bit<16> symbol_10;
    bit<16> symbol_11;
    bit<16> symbol_12;
    bit<16> symbol_13;
    bit<16> symbol_14;
    bit<16> symbol_15;
    bit<16> symbol_16;
    bit<16> symbol_17;
    bit<16> symbol_18;
    bit<16> symbol_19;
}

struct headers {
    ethernet_t ethernet;
    ipv4_t     ipv4;
    udp_h udp;
    netec_h netec;
    netec_helper_h netec_helper;
}

parser ParserImpl(packet_in packet, out headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    state parse_ethernet {
        packet.extract(hdr = hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            16w0x800: parse_ipv4;
            default: accept;
        }
    }
    state parse_ipv4 {
        packet.extract(hdr = hdr.ipv4);
        transition select(hdr.ipv4.protocol) {
            17: parse_udp; 
            default : accept;
        }
    }
    state parse_udp {
        packet.extract(hdr = hdr.udp);
        
        transition select(hdr.udp.dst_port) {
        20000: parse_netec;
        19998: parse_netec_helper;
        19999: parse_netec_helper;
        default : accept;
        }
    }
    state start {
        transition parse_ethernet;
    }
    state parse_netec {
        packet.extract(hdr = hdr.netec);
        transition accept;
    }
    state parse_netec_helper {
        packet.extract(hdr = hdr.netec_helper);
        transition accept;
    }
}

control egress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {
    }
}


control ingress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {

    register<bit<2>>(2048) reg;
    #include "mult.p4"
    #include "xor.p4"
    action a_get_coeff(bit<16> coeff){
        meta.coeff = 16w0x0000 ++ coeff;
    }
    table get_coeff{
        key = {standard_metadata.ingress_port: exact;}
        actions = {a_get_coeff;}
        size = 512;
    }

    action incr(){
        reg.read(meta.count,hdr.netec.index);
        meta.count = meta.count + 1;
        reg.write(hdr.netec.index,meta.count);
        
    }
    action a_2(){
        standard_metadata.egress_spec = 2;
    }
    action a_1(){
        meta.l4_length = hdr.ipv4.totalLen - 20;
        meta.ip_proto_16 = 8w0x0 ++ hdr.ipv4.protocol;
        standard_metadata.egress_spec = 1;
    }
    action drop(){
        standard_metadata.egress_spec = 0;
    }
  
    apply {
        if(hdr.udp.dst_port == 19998){
            populate_log_table();
        } else if (hdr.udp.dst_port == 19999){
            populate_ilog_table();
        } else if (hdr.udp.dst_port == 20000){
            get_coeff.apply();
            if(standard_metadata.ingress_port == 1){
                a_2();
            }else{
                if(hdr.ipv4.isValid()){
    if(hdr.netec.symbol_0 != 0){
        mult_0();
    } 
    if(hdr.netec.symbol_1 != 0){
        mult_1();
    } 
    if(hdr.netec.symbol_2 != 0){
        mult_2();
    } 
    if(hdr.netec.symbol_3 != 0){
        mult_3();
    } 
    if(hdr.netec.symbol_4 != 0){
        mult_4();
    } 
    if(hdr.netec.symbol_5 != 0){
        mult_5();
    } 
    if(hdr.netec.symbol_6 != 0){
        mult_6();
    } 
    if(hdr.netec.symbol_7 != 0){
        mult_7();
    } 
    if(hdr.netec.symbol_8 != 0){
        mult_8();
    } 
    if(hdr.netec.symbol_9 != 0){
        mult_9();
    } 
    if(hdr.netec.symbol_10 != 0){
        mult_10();
    } 
    if(hdr.netec.symbol_11 != 0){
        mult_11();
    } 
    if(hdr.netec.symbol_12 != 0){
        mult_12();
    } 
    if(hdr.netec.symbol_13 != 0){
        mult_13();
    } 
    if(hdr.netec.symbol_14 != 0){
        mult_14();
    } 
    if(hdr.netec.symbol_15 != 0){
        mult_15();
    } 
    if(hdr.netec.symbol_16 != 0){
        mult_16();
    } 
    if(hdr.netec.symbol_17 != 0){
        mult_17();
    } 
    if(hdr.netec.symbol_18 != 0){
        mult_18();
    } 
    if(hdr.netec.symbol_19 != 0){
        mult_19();
    }

                    incr();
                    xor();
                }
                if(meta.count == 3){
                    a_1();
                }
                else{
                    drop();
                }
            }
        }
    }
}

control DeparserImpl(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ipv4);
        packet.emit(hdr.udp);
        packet.emit(hdr.netec);
    }
}

control verifyChecksum(inout headers hdr, inout metadata meta) {
    apply {
    }
}

control computeChecksum(inout headers hdr, inout metadata meta) {
    apply {
        update_checksum(hdr.udp.isValid(),
            { 
                hdr.ipv4.srcAddr,
                hdr.ipv4.dstAddr,
                meta.ip_proto_16,
                meta.l4_length,
                hdr.udp.src_port,
                hdr.udp.dst_port,
                hdr.udp.hdr_length,
                hdr.netec
            },
            hdr.udp.checksum, HashAlgorithm.csum16);
    }
}

V1Switch(ParserImpl(), verifyChecksum(), ingress(), egress(), computeChecksum(), DeparserImpl()) main;
