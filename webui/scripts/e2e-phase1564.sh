#!/usr/bin/env bash
# Phase-1564: STATUS mentions session notes in surface / 1561-1568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session.?storage.?notes.*(surface|in surface)|surface.*session.?storage.?notes' webui/STATUS.md
grep -qE 'phase1568|through 1568|e2e-phase1568' webui/STATUS.md
echo "STATUS surface+session notes ok"
echo "cleaned"
echo "OK: phase1564 e2e passed"
