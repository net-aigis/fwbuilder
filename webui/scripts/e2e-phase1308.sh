#!/usr/bin/env bash
# Phase-1308: STATUS mentions soft_fertig_surface_notes / 1305-1312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'soft_fertig_surface_notes|surface notes' webui/STATUS.md
grep -qE 'phase1312|through 1312|e2e-phase1312' webui/STATUS.md
echo "STATUS surface notes ok"
echo "cleaned"
echo "OK: phase1308 e2e passed"
