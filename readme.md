# Common Cores
Common IP cores intended for internal use in projects under Sigma Logic organization. Mainly targeting **Gowin Arora V** FPGA chips family, but not exclusively.

# License
You are free to use IP cores with no limitations in personal projects or by including this git repository as a submodule in your project.
If you copy, edit, modify or indirectly adding contents (hdl code) of the IP cores in a public project,
please mention original [repository](https://github.com/sigma-logic/common-cores) link and the author ([repo](https://github.com/sigma-logic/common-cores) owner) in comments inside hdl code or **readme.md** file. Do not use in commertial projects.

# Cores
|Name                                                                                |Description                          |Dev Status    |Notes
|:-----------------------------------------------------------------------------------|:------------------------------------|:-------------|:--------------------------------------------|
|[WS2812](https://github.com/sigma-logic/common-cores/tree/main/cores/ws2812)        |Addressable RGB led driver           |New (unstable)|Supports only single LED
|[RGMII](https://github.com/sigma-logic/common-cores/tree/main/cores/rgmii)          |RGMII phy level                      |WiP (unstable)|Network stack up to you, it's only DDR buffer
|[Simple PLL](https://github.com/sigma-logic/common-cores/tree/main/cores/simple_pll)|PLL configuration covering most needs|Stable        |Just cozy PLL module
---
###### [Telegram](https://t.me/limpix31), [Sigma Logic Discord Server](https://discord.gg/HPJJsenZ76)

