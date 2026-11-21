#!/usr/bin/env bash
# Phase-892: STATUS mentions pages/sections/stack_names / 889-896.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'pages/sections/stack_names|stack_names_count|pages=/sections=/stacks=' webui/STATUS.md
grep -qE 'phase896|through 896|e2e-phase896' webui/STATUS.md
echo "STATUS pages/sections/stacks ok"
echo "cleaned"
echo "OK: phase892 e2e passed"
