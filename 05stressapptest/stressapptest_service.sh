#!/bin/bash
echo "Running stressapptest with ${SIZE}MiB for ${TIME} seconds..."
/usr/bin/stressapptest -M $SIZE -s $TIME | tee /tmp/stressapptest.log
echo "Test logs have been saved to /tmp/stressapptest.log"
echo "Dropping into emergency shell for user input!"
