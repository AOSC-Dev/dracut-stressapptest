# dracut module for executing stressapptest from initrd

By default, the module only installs stressapptest main executable. To
run test on boot and customize behavior, use the following kernel parameters:

## Kernel command line options

### `rd.sat`: enable this module and run stressapptest on boot then reboot/poweroff

When this option is specified:
- run stressapptest on boot
- pause to display results
- press a key to reboot or poweroff

### `rd.sat.memsz=N`: memory size in MiB (`-M` flag)

Optional - only effective when a test is requested. Defaults to 90% of free memory available.

### `rd.sat.time`: time to test in seconds (`-s` flag)

Defaults to 600 (10 minutes)
