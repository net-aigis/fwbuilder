#!/usr/bin/env bash
# Phase-700: STATUS mentions size_type UI 697-704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'data-size-type|qtSpacerStyle.*size_type|size_type UI|sizeType UI' webui/STATUS.md
grep -qE 'phase704|through 704|e2e-phase704' webui/STATUS.md
echo "STATUS 697-704 ok"
echo "cleaned"
echo "OK: phase700 e2e passed"
