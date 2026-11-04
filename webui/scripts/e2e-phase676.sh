#!/usr/bin/env bash
# Phase-676: STATUS mentions SSH notes 673-680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'ssh_alternative_notes|ssh_refusal_path_notes|alternative_notes' webui/STATUS.md
grep -qE 'phase680|through 680|e2e-phase680' webui/STATUS.md
echo "STATUS 673-680 ok"
echo "cleaned"
echo "OK: phase676 e2e passed"
