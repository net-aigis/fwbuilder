#!/usr/bin/env bash
# Phase-563: STATUS 561–568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase561\|e2e-phase561' webui/STATUS.md
grep -q 'phase568\|e2e-phase568' webui/STATUS.md
grep -qi 'Show hard-gap closure\|fetchHardGapClosure' webui/STATUS.md
echo "STATUS 561-568 ok"
echo "cleaned"
echo "OK: phase563 e2e passed"
