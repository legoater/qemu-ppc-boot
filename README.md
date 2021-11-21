# QEMU PPC boot tester

Run a test doing a basic boot with network and poweroff for each PPC
machines supported in QEMU using a builroot image specifically built
for these.

## Supported machines

* `bamboo/ppc`
* `sam460ex/ppc`
* `g3beige/ppc`
* `mac99/ppc`  
* `e500mc/ppc`
* `mpc8544ds/ppc`
* `e5500/ppc64`
* `mac99/ppc64` with 64bit and 32bit user space
* `pseries/ppc64`
* `pseries/ppc64le`
* `powernv8/ppc64le`
* `powernv9/ppc64le`

Tests currently broken ;

* `ref405ep/ppc` 405 
* `mac99/ppc` using 745x CPUs

## Building

This ``builroot`` tree contains all the default configuration for the
above machines : https://github.com/legoater/buildroot/

## Run

For all tests, simply run :

```
$./ppc-test.sh -q --prefix=/path/to/qemu/install/
bamboo : OK
sam460ex : OK
g3beige : OK
mac99 : OK
e500mc : OK
e5500 : OK
g5-32 : OK
g5-64 : OK
pseries : OK
pseriesle : OK
powernv8 : OK
powernv9 : OK
```

For a simple machine with a verbose output, run

```./ppc-test.sh --prefix=/path/to/qemu/install/ <machine>```

