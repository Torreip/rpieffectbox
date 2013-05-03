v 20110115 2
C 40000 40000 0 0 0 title-B.sym
N 49300 47700 49300 42600 4
N 49300 42600 52000 42600 4
N 52000 42600 52000 47700 4
N 52000 47700 49300 47700 4
T 50200 45100 9 10 1 0 0 0 1
MCP3008
T 49400 47400 9 10 1 0 0 0 1
1
T 51600 47400 9 10 1 0 0 0 1
16
N 52000 47500 52600 47500 4
N 52600 46900 52600 48500 4
N 42200 48500 52600 48500 4
T 40000 48400 9 10 1 0 0 0 1
To Raspberry pi pin 2 (5v)
T 51600 46800 9 10 1 0 0 0 1
15
T 51600 46100 9 10 1 0 0 0 1
14
N 52000 46200 53300 46200 4
N 53300 46200 53300 48900 4
N 53300 48900 42400 48900 4
T 40000 48800 9 10 1 0 0 0 1
To Raspberry Pi pin 6 (GND)
N 52000 46900 52600 46900 4
T 51600 45400 9 10 1 0 0 0 1
13
N 52000 45500 53700 45500 4
N 53700 45500 53700 49300 4
N 53700 49300 42200 49300 4
T 40000 49200 9 10 1 0 0 0 1
To Raspberry pi pin 23
T 51600 44700 9 10 1 0 0 0 1
12
N 52000 44700 54200 44700 4
N 54200 44700 54200 49700 4
N 54200 49700 42200 49700 4
T 40000 49600 9 10 1 0 0 0 1
To Raspberry pi pin 21
T 51600 44000 9 10 1 0 0 0 1
11
N 52000 44000 54700 44000 4
N 54700 44000 54700 50100 4
N 54700 50100 42200 50100 4
T 40000 50000 9 10 1 0 0 0 1
To Raspberry pi pin 19
T 51600 43300 9 10 1 0 0 0 1
10
T 51700 42700 9 10 1 0 0 0 1
9
N 52000 43400 54700 43400 4
N 52000 42800 54700 42800 4
T 54800 43300 9 10 1 0 0 0 1
To Raspberry pi pin 24
T 54800 42700 9 10 1 0 0 0 1
To Raspberry pi pin 6 (GND)
T 49400 46800 9 10 1 0 0 0 1
2
T 49400 46100 9 10 1 0 0 0 1
3
C 43000 45800 1 0 0 pot-bourns.sym
{
T 43800 46700 5 10 0 0 0 0 1
device=VARIABLE_RESISTOR
T 43600 46200 5 10 1 1 0 0 1
refdes=R7
}
C 42900 44200 1 0 0 pot-bourns.sym
{
T 43700 45100 5 10 0 0 0 0 1
device=VARIABLE_RESISTOR
T 43500 44600 5 10 1 1 0 0 1
refdes=R8
}
C 42900 41200 1 0 0 pot-bourns.sym
{
T 43700 42100 5 10 0 0 0 0 1
device=VARIABLE_RESISTOR
T 43500 41600 5 10 1 1 0 0 1
refdes=R10
}
T 49400 45400 9 10 1 0 0 0 1
4
N 43500 46400 43500 47500 4
N 43500 47500 49300 47500 4
N 43400 44800 43400 45400 4
N 43400 45400 48100 45400 4
N 48100 45400 48100 46900 4
N 48100 46900 49300 46900 4
N 43400 43800 45000 43800 4
N 45000 43800 45000 45000 4
N 45000 45000 48500 45000 4
N 48500 45000 48500 46200 4
N 48500 46200 49300 46200 4
N 49300 45500 48800 45500 4
N 48800 44400 48800 45500 4
N 45300 44400 48800 44400 4
N 45300 41800 45300 44400 4
N 45300 41800 43400 41800 4
N 43000 45900 42900 45900 4
C 42900 42600 1 0 0 pot-bourns.sym
{
T 43700 43500 5 10 0 0 0 0 1
device=VARIABLE_RESISTOR
T 43500 43000 5 10 1 1 0 0 1
refdes=R9
}
N 43400 43800 43400 43200 4
N 42900 40700 42900 45900 4
N 43900 45900 43900 44300 4
N 43900 44300 43800 44300 4
N 43800 41300 43800 44300 4
N 43900 45900 44600 45900 4
N 44600 45900 44600 48500 4
N 43000 45900 43000 48900 4
C 46000 43100 1 0 0 switch-pushbutton-no-1.sym
{
T 46400 43400 5 10 1 1 0 0 1
refdes=S1
T 46400 43700 5 10 0 0 0 0 1
device=SWITCH_PUSHBUTTON_NO
}
C 46000 41900 1 0 0 switch-pushbutton-no-1.sym
{
T 46400 42200 5 10 1 1 0 0 1
refdes=S2
T 46400 42500 5 10 0 0 0 0 1
device=SWITCH_PUSHBUTTON_NO
}
C 46000 40700 1 0 0 switch-pushbutton-no-1.sym
{
T 46400 41000 5 10 1 1 0 0 1
refdes=S3
T 46400 41300 5 10 0 0 0 0 1
device=SWITCH_PUSHBUTTON_NO
}
N 46000 40700 46000 43100 4
N 46000 40700 42900 40700 4
C 47200 41800 1 0 0 resistor-1.sym
{
T 47500 42200 5 10 0 0 0 0 1
device=RESISTOR
}
C 47200 40600 1 0 0 resistor-1.sym
{
T 47500 41000 5 10 0 0 0 0 1
device=RESISTOR
}
C 47200 43000 1 0 0 resistor-1.sym
{
T 47500 43400 5 10 0 0 0 0 1
device=RESISTOR
}
N 47000 43100 47200 43100 4
N 47000 41900 47200 41900 4
N 47000 40700 47200 40700 4
T 48200 41800 9 10 1 0 0 0 1
Rpi pin 7
C 46200 40200 1 0 0 resistor-1.sym
{
T 46500 40600 5 10 0 0 0 0 1
device=RESISTOR
}
C 46300 41400 1 0 0 resistor-1.sym
{
T 46600 41800 5 10 0 0 0 0 1
device=RESISTOR
}
C 46200 42500 1 0 0 resistor-1.sym
{
T 46500 42900 5 10 0 0 0 0 1
device=RESISTOR
}
N 46200 42600 46000 42600 4
N 46300 41500 46000 41500 4
N 46200 40300 45800 40300 4
N 45800 40300 45800 40700 4
N 47200 41500 47200 41900 4
N 47100 42600 47100 43100 4
N 47100 40300 47200 40300 4
N 47200 40300 47200 40700 4
T 46100 42700 9 10 1 0 0 0 1
R1 .2 OHMS
T 46100 41600 9 10 1 0 0 0 1
R2 .2 OHMS
T 46100 40400 9 10 1 0 0 0 1
R3 .2 OHMS
T 47200 43300 9 10 1 0 0 0 1
R4 10k OHMS
T 47200 42100 9 10 1 0 0 0 1
R5 10k OHMS
T 47200 40900 9 10 1 0 0 0 1
R6 10k OHMS
T 48200 40600 9 10 1 0 0 0 1
Rpi pin 11
T 48200 43000 9 10 1 0 0 0 1
Rpi pin 12
T 40200 45200 9 10 1 0 0 0 7
Rx, Tx and GND of the
Serial LCD backpack
go to the Rpi's 
Rx, Tx and GND.
No level shifting is necessary.
This assumes you are using a 
K107 R4 from Wulden.
T 50400 44400 9 10 1 0 0 0 1
ADC
