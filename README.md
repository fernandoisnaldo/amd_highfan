# amd_highfan
Increase the GPU fan speed when it gets close to critical temperature.

Systemd service that increases GPU fan speed, when it detects temperature close to critical, was created especially for a default model of Vega 56, running on a Debian operating system with amdgpu driver.

This program is exempt from warranty and I am not responsible for its use by third parties, since it was created specifically for my environment and needs, and it has not been tested in other computer.

Recommend for study and test purposes only.


**TODO:**

a) Create script to put **amdmaxflowd.sh** in `/usr/sbin` and **amdgpu_maxflow.service** in `/etc/systemd/system`.
