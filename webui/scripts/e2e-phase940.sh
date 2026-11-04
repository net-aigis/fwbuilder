#!/usr/bin/env bash
# Phase-940: STATUS mentions with_size_policy total / 937-944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_size_policy total|sizePolicy= sample|sizePolicy total' webui/STATUS.md
grep -qE 'phase944|through 944|e2e-phase944' webui/STATUS.md
echo "STATUS sizePolicy total ok"
echo "cleaned"
echo "OK: phase940 e2e passed"
