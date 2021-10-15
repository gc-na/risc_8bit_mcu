# risc_8bit_mcu

IR: op-code. 명령어 보관 장소. 처음에 명령어 호출(Fetch) 때 1됨.  
INC: Fetch되면 IR 1된 후, address에 +1 해줌.  
INST_LD: INC가 1되면, 다음 명령어 Prefetch해줌.  
READ:Execution의 시작부.  
MDR: Data 저장 장소.  
READ된 뒤 ALU한테 보냄.  
ACC: ALU(연산블록) 결과를 저장하는 레지스터.  
MDR 끝나고 Write Back 때 실행.
