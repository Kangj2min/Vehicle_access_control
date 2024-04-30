## Vehicle_access_control

This project is to study how to implement Vehicle Access Control in Verilog. This system can counting car in or out.


### control.v
This code is Core functions of this system. A and B are able to detect car if it is in or out. a can be detected after b while entering car. these sensor maintain '0' in normal time, if car enter, these trun to 1 each other.

If both a and b turn to 1 at the same time, this means car entering. As long as car enter or exit, it sends a signal to datapath that count number of cars.
 control.v 코드는 이 시스템의 핵심 모듈입니다. a,b는 차량 감지 센서로서 만약 차량이 들어올 경우 센서a 부터 감지하게 되고 이어서 b가 감지됩니다. 이 센서는 평상시에는 0을 유지하지만 차량이 진입할 경우 1로 변합니다.



### datapath.v

When this code receives signal that entering or exiting, it calculates the number of vehicles and outputs it in 4bits.

