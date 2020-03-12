#!/usr/bin/env bash
#
export LC_ALL=C
UNTERMINATED_LOGS=$(git grep --extended-regexp "LogPrintf?\(" -- "*.cpp" | \
    grep -v '\\n"' | \
    grep -v '\.\.\.' | \
    grep -v "/\* Continued \*/" | \
    grep -v "LogPrint()" | \
    grep -v "LogPrintf()")
if [[ ${UNTERMINATED_LOGS} != "" ]]; then
    # shellcheck disable=SC2028
    echo "All calls to LogPrintf() and LogPrint() should be terminated with \\n"
    echo
    echo "${UNTERMINATED_LOGS}"
    exit 1
fi
