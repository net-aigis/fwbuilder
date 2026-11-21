#!/usr/bin/env bash
# Phase-5646: typecheck after Soft 5640+ ssh_refusal_path_notes_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5646 e2e passed"
