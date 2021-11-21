# QEMU PPC boot tester

Run a test doing a basic boot with network and poweroff for each PPC
machines supported in QEMU using a builroot image specifically built
for these.

## Supported machines

* `bamboo/ppc` 440EP CPU
* `sam460ex/ppc` 460EX CPU  (equivalent to a 440)
* `g3beige/ppc` G3 CPU
* `mac99/ppc`  G4 CPU
* `e500mc/ppc` e500mc CPU
* `mpc8544ds/ppc` e500v2 CPU
* `e5500/ppc64` e5500 CPU
* `mac99/ppc64` 970 CPU with 64bit and 32bit user space
* `pseries/ppc64` POWER7 only
* `pseries/ppc64le` POWER8, POWER9, POWER10 (missing insns in QEMU 7.0)
* `powernv8/ppc64le` POWER8 HV CPU
* `powernv9/ppc64le` POWER9 HV CPU

Tests currently broken ;

* `ref405ep/ppc` issue in CPU 405EP model (Soft TLBs probably)
* `mac99/ppc` using 745x CPUs (Soft TLBs)

## Building

This ``builroot`` tree contains all the default configuration for the
above machines : https://github.com/legoater/buildroot/

## Run

For all tests, simply run :

```
$ ./ppc-test.sh -q --prefix=/path/to/qemu/install/
bamboo : DONE (PASSED)
sam460ex : DONE (PASSED)
g3beige : DONE (PASSED)
mac99 : DONE (PASSED)
mpc8544ds : DONE (PASSED)
e500mc : DONE (PASSED)
e5500 : DONE (PASSED)
g5-32 : DONE (PASSED)
g5-64 : DONE (PASSED)
pseries : DONE (PASSED)
pseriesle8 : DONE (PASSED)
pseriesle9 : DONE (PASSED) 
pseriesle10 : SIGILL (FAILED)
powernv8 : DONE (PASSED)
powernv9 : DONE (PASSED)
```

The ref405ep machine is not included by default :

```
$ ./ppc-test.sh -q --prefix=/path/to/qemu/install/
ref405ep : SEGV (FAILED)
```

For a simple machine with a verbose output, run

```
$ ./ppc-test.sh --prefix=/path/to/qemu/install/ <machine>
```
