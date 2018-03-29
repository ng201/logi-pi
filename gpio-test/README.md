# GPIO-TEST

Basic verilog project to affect the behavior of the LOGI Pi with the value GPIO pin shared between the RPi and LOGI Pi. 

# Instruction

1. Create a new project in Xilinx ISE. Add all the verilog files to the project and create the bitfile.
2. Load the generated bitstream with the *logi_loader*.
3. Change the value of the GPIO to change the blibking sequence:
```bash
root@raspberrypi:~# echo "27" > /sys/class/gpio/export
root@raspberrypi:~# echo "out" > /sys/class/gpio/gpio27/direction
root@raspberrypi:~# echo "1" > /sys/class/gpio/gpio27/value
root@raspberrypi:~# echo "0" > /sys/class/gpio/gpio27/value
root@raspberrypi:~# echo "1" > /sys/class/gpio/gpio27/value
```
