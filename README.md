# QEMU PPC boot tester

Run a test doing a basic boot with network and poweroff for each PPC
machines supported in QEMU using a builroot image specifically built
for these.

## Supported machines

* `prep/ppc` 604 CPU
* `ref405ep/ppc` 405EP CPU
* `bamboo/ppc` 440EP CPU
* `sam460ex/ppc` 460EX CPU  (equivalent to a 440)
* `g3beige/ppc` G3 CPU
* `mac99/ppc`  G4 CPU
* `e500mc/ppc` e500mc CPU
* `mpc8544ds/ppc` e500v2 CPU
* `ppce500/ppc64` e5500, e6500
* `mac99/ppc64` 970 CPU with 64bit and 32bit user space
* `pseries/ppc64` POWER5+, 970, 970MP, POWER7
* `pseries/ppc64le` POWER8, POWER9, POWER10
* `powernv8/ppc64le` POWER8 HV CPU
* `powernv9/ppc64le` POWER9 HV CPU

## Building

This ``builroot`` tree contains all the default configuration for the
above machines : https://github.com/legoater/buildroot/

## Run

For all tests, simply run :

```
$ ./ppc-boot.sh -q --prefix=/path/to/qemu/install/
ref405ep : Linux /init login DONE (PASSED)
bamboo : Linux /init net login DONE (PASSED)
sam460ex : Linux Linux /init net login DONE (PASSED)
g3beige : FW Linux Linux /init net login DONE (PASSED)
mac99-g4 : FW Linux Linux /init net login DONE (PASSED)
mpc8544ds : Linux /init net login DONE (PASSED)
e500mc : Linux /init net login DONE (PASSED)
40p : FW login DONE (PASSED)
e5500 : Linux /init net login DONE (PASSED)
e6500 : Linux /init net login DONE (PASSED)
g5-32 : FW Linux Linux /init net login DONE (PASSED)
g5-64 : FW Linux Linux /init net login DONE (PASSED)
pseries-970 : FW Linux Linux /init net login DONE (PASSED)
pseries-970mp : FW Linux Linux /init net login DONE (PASSED)
pseries-POWER5+ : FW Linux Linux /init net login DONE (PASSED)
pseries : FW Linux Linux /init net login DONE (PASSED)
pseriesle8 : FW Linux Linux /init net login DONE (PASSED)
pseriesle9 : FW Linux Linux /init net login DONE (PASSED)
pseriesle10 : FW Linux Linux /init net login DONE (PASSED)
powernv8 : FW Linux /init net login DONE (PASSED)
powernv9 : FW Linux /init net login DONE (PASSED)
```

For a simple machine with a verbose output, run

```
$ ./ppc-boot.sh --prefix=/path/to/qemu/install/ <machine>
```
