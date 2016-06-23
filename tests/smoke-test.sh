#!/usr/bin/env bash

declare -i timeout=5

while ! TEST_OUTPUT=`curl -s --fail http://localhost`;
    do sleep 0.1;
done

## Assert server response
if [ "$TEST_OUTPUT" != '<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="refresh" content="1;url=/core/install.php" />

        <title>Redirecting to /core/install.php</title>
    </head>
    <body>
        Redirecting to <a href="/core/install.php">/core/install.php</a>.
    </body>
</html>' ]
then
    echo "Failed asserting that '${TEST_OUTPUT}' equals Drupal Installer response" && exit 1;
fi
