# amd_highfan
Increase the GPU fan speed when it gets close to critical temperature.

Script that increases GPU fan speed, when it detects temperature close to critical, was created especially for one reference model of AMD Radeon RX 56 Vega, running on a Debian operating system with amdgpu driver.

This program is exempt from warranty and I am not responsible for its use by third parties, since it was created specifically for my environment and needs, it has not been tested in other computer.

Recommend for test, study and modify purposes only.


**TODO:**

a) Create script to put **amdmaxflowd.sh** in `/usr/sbin` and **amdgpu_maxflow.service** in `/etc/systemd/system`.
b) Implement multi-gpu detection.
