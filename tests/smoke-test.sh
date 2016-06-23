#!/usr/bin/env bash

declare -i timeout=5

while ! TEST_OUTPUT=`curl -s --fail http://localhost`;
    do sleep 0.1;
done

## Assert server response
if [ "$TEST_OUTPUT" != "Hello!" ]
then
    echo "Failed asserting that '${TEST_OUTPUT}' equals 'Hello!'" && exit 1;
fi
