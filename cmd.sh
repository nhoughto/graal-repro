#!/bin/bash
./gradlew jar
native-image \
-cp build/libs/graal-repro.jar \
-H:+UseLowLatencyGC \
-R:MinHeapSize=64m \
-R:MaxNewSize=32m \
-R:MaxHeapSize=128m \
-H:+AllowIncompleteClasspath \
-H:ClassInitialization=com.oracle.truffle.js:build_time,com.oracle.js.parser:build_time,com.oracle.truffle.trufflenode:build_time,com.oracle.truffle.regex:build_time \
-H:ClassInitialization=com.ibm.icu:run_time \
-H:+ReportUnsupportedElementsAtRuntime \
-H:+ReportExceptionStackTraces \
-H:Name=output \
-H:FallbackThreshold=0 \
-H:Path=build \
--no-server \
--language:js \
-H:Class=Test \
--verbose \
-J-da
